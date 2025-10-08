Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D530CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 06:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6Njs-0003gn-Ot; Wed, 08 Oct 2025 02:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v6Njp-0003f9-GT
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 02:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v6Njn-00044p-Eu
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 02:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759905202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vGu5NUkWTmM8xp02DSha/6JicvMpvGgFEi+1YVEX+6Y=;
 b=WI8EfM44kdgBNb/+f5Mb4rcjVJxh3FCICek2JF3bkEs/x8Vpp1BZ3NKTqH4Wyt8jzy5KRM
 okynCXKwlxpnYyyRMe68ht5FaB9wDIBtWAUi/NXVKahAcRehtoayQlHHd37ORvYCjs+jkS
 bGpKPmU042sAfa+HI/rfNzTjVYgZ7+I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-sUy0DuqaMd6sxQF0Q3g5FA-1; Wed, 08 Oct 2025 02:33:20 -0400
X-MC-Unique: sUy0DuqaMd6sxQF0Q3g5FA-1
X-Mimecast-MFC-AGG-ID: sUy0DuqaMd6sxQF0Q3g5FA_1759905200
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3ece14b9231so3778776f8f.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 23:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759905199; x=1760509999;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGu5NUkWTmM8xp02DSha/6JicvMpvGgFEi+1YVEX+6Y=;
 b=g93FiEZPlSHo/6G0FJmrTm5dwo58yKqD42eDnm9jvBJOt5HBbXg0qaPFkFTOSgsvT0
 1J7FO5se0yzc2bTFDNhhiKeeGrg1v8HR0BJ1q0o80Imd15XwQxdBdCJrLNtqukwmYG7c
 aQfyS9YytAH9NFAqW88FwVgNt3Kq4zu69+7wAW3uVHLZyBbbaYXOicgi+JQhO0jQtQet
 o8n5jYmXfcxdm4WTB97Quw0iWN8Ro8yRm3S0LZGpoxQHFoDIkiBV4vGIq9FsVecXRVp7
 inS8TnTpy5ZHcpYbxAlO9jXQO41w1FtV4cYgICLt+A1GcZGKtAfIktbx/fOgvxsU7U0X
 bNBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2x2Muew+aUAfS1yWHD81I2UpksKKkdjkKo3fyNVXfcIb2JBpkbClQRxJbaLsri0ZlyThQz/ckVA==@nongnu.org
X-Gm-Message-State: AOJu0YyPN1TYhDphvIHEG86XETVLHjpw/uG253ZHWvr9v3+S7Fli8Fjw
 LqHnc1AiQte6OkE2tP7M4vYpjTCNCRDdi16xZbqO0znke8eJgWsxgls4aHhpA2P2HVHv9I+UmmS
 XZZByAKLz5CoUw8Dx4wQ3uYwhIKU9WhfW4otkNiKRwE4/WxxgsN1v6laVL/ccFg==
X-Gm-Gg: ASbGncvy6ThAfYfqsSDRzG/q7m59mfamNKedwvUdL8yjC7VfNL7Euwo77XhQqNVU0pR
 zdkW78cYY3GLaHAAzRPQVWX18kakE2eqAav3TK5wAUIxcOMcJ+v+Zyq7R3nhYg1bBOckXZAK2iU
 bmdOXLm5wB2/YwdAM+psk4BcrfUkdzrrW4L2HpLvTLCAMsz56zjcJllSBd/5V0B2KwjPWJg+DCw
 LZTQl5cSJkBXYF5oQN0KYmsAxg6em/Yk5II2/jLpWDirpBxWGB2DqDSgC1C0Lxsy68/3zv3mpQ5
 3CyzQCk9U4+O+B8tt+H5v6+9PzUSjnSbE5lV1nS6OiQm6q+B1EfpAT3AF1y+Lh9QMwZTG1WNnnu
 M2iTfXj7o0A==
X-Received: by 2002:a05:6000:603:b0:401:5ad1:682 with SMTP id
 ffacd0b85a97d-4266e7bf04fmr1196572f8f.14.1759905199587; 
 Tue, 07 Oct 2025 23:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP+pHHx6IEXcB8OHvuEkHt/ZnISvBHRaau3f6ic3Jp8liyJk+FjrCCovM6WBS0OLxrScJJXQ==
X-Received: by 2002:a05:6000:603:b0:401:5ad1:682 with SMTP id
 ffacd0b85a97d-4266e7bf04fmr1196557f8f.14.1759905199241; 
 Tue, 07 Oct 2025 23:33:19 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-083.pools.arcor-ip.net.
 [47.64.112.83]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f0392sm28799089f8f.42.2025.10.07.23.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 23:33:18 -0700 (PDT)
Message-ID: <aa0df711-0605-4c1c-9424-8a79480c35b1@redhat.com>
Date: Wed, 8 Oct 2025 08:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] test/functional/aarch64: Remove test for the
 ast2700a0-evb machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20251007141604.761686-1-clg@redhat.com>
 <20251007141604.761686-5-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251007141604.761686-5-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IYltYRfBxALF8EBFDC3mgX9yMShhyYCR-kx5DdckPZM_1759905200
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 07/10/2025 16.16, Cédric Le Goater wrote:
> The 'ast2700a0-evb' machine was deprecated in commit 6888a4a9c860 and
> removal is scheduled in the QEMU 11.0 release. This change removes
> the corresponding tests ahead of time to save CI resources.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aarch64/test_aspeed_ast2700.py | 12 ------------
>   1 file changed, 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


