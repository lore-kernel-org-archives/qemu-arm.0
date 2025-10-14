Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E7CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 10:47:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8cYg-0000de-Fu; Tue, 14 Oct 2025 06:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8cYf-0000dW-Ld
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8cYd-00041V-JF
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 06:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760438825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r7SYV5yRsu+kQhBtG8+ZO4HIbJ8BJckGDMn7/VeClAQ=;
 b=jPbecT5CUu7xzPzlrM1FYb/KsiHVALUp3hcLC3Gh5c9utdwu+DkwuZaTI/IuWACtBAQ93f
 OcDGp2jN3K0YwdJ55K1Ji7SJqdbRVtBw8Ax1uPLjcXaJ9oW0n0trQprR50ce3bo8kMnd93
 8SrRD/kP2zJ/WFLjOTeR+mEYnPvSZj4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-yuln4lUJOJiyUOuOaZmLlw-1; Tue, 14 Oct 2025 06:47:04 -0400
X-MC-Unique: yuln4lUJOJiyUOuOaZmLlw-1
X-Mimecast-MFC-AGG-ID: yuln4lUJOJiyUOuOaZmLlw_1760438823
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-46e377d8c80so19536525e9.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 03:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760438823; x=1761043623;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7SYV5yRsu+kQhBtG8+ZO4HIbJ8BJckGDMn7/VeClAQ=;
 b=Ts0Q0YBjSIh2Cs+3Jo7Zv/sr7iTpKmgYQ37yHSLzu9OK6NQJxCEYu7UUSr8VDj6Nzp
 2QwzKCJxwlP9mF+CT18kk3IBNqL0AOobW/ks0FlYyIDoSCFLh4TxQNawdVtq15fvNSp9
 JWQJ7p7MDgtWEieDz12RpKHNbt31tUY5W8JRlRwFoBnc2ZO7M3JQyRcvivOXHQfUOrzJ
 Eqz0YD+1tH09uWVvup6pagpUPoeb8kZkchXhflBPnNQJ72Z/tk/NTKoc0MCmpuy+0M6c
 l4ip0dgCsJxn54zNtXO73uStf7smLkh6tCjwv2Xpje8ZTOJc/00bm+ZjnDJPdyaAZB4O
 a26g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXcP/dEQ0FqlXWZ1YPtmG5YU7Thch6FPXgZcBz8QG7iKfLL14ulCrZLOHt3OmGpdIeRKLL+BWTOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxRL7U+yPu/8JQ1XFS82zBcSyPFfMxUIj4/lYIHHMg47z2cXoSj
 jZW2b1MKKYys5kqBj+1SwYRVGzlnwAdWn1eN+Z3m43awnXpKHFfuumaO94OJ6hZ8Hg3Gkq12LlY
 lHWA35NoMoI0jdQMp5YSFDsdZlO+pFh0Kq4h7R4XdQVhOpYtMtbsAKw==
X-Gm-Gg: ASbGncuI5vI/yLDTBxQUSJElaz4ZQ0oGeNrE8+7GaNDRDgbc9nfYKrlDYlqaKOupbU1
 OhBFFNfg7kN9fdXRpLxvs8/P+44ovwioDFOgocQEw8GXMxnIW1wN/75HgQ7hIZ4//kIk4FtcFbu
 wdykhUcfa/XapR7hOkDJrr9THRF4Ry1djTg6ldMpIpBDf4GzZMwaA5wosOZsqvcNunUTHqL/C/m
 K6FfWecdThcL5G9046ZZQxVzc28gMNYh6uTOv413A8WvzvMmFWigURv0GxHEcukHEbQlDfxRV84
 ZU07dtcyAusTxoT9V7pi0AdiEY62Ewxpe3fafDkcM3OzGoeqRGMRZO5cmk08C/HL+vwVGygo6kB
 VmS26yA==
X-Received: by 2002:a05:600c:628e:b0:46d:996b:826f with SMTP id
 5b1f17b1804b1-46fa9afbb26mr161424565e9.25.1760438822849; 
 Tue, 14 Oct 2025 03:47:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvxuu/gLWf/gNaPoKX7kuCub1yptnF+jdSOzuRON/vrMQK1PHMXq9Ivp3wpGmQspD4MNn9EQ==
X-Received: by 2002:a05:600c:628e:b0:46d:996b:826f with SMTP id
 5b1f17b1804b1-46fa9afbb26mr161424325e9.25.1760438822511; 
 Tue, 14 Oct 2025 03:47:02 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-136.pools.arcor-ip.net.
 [47.64.112.136]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483bbb4sm228219885e9.5.2025.10.14.03.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 03:47:02 -0700 (PDT)
Message-ID: <c5003498-7914-4d94-bb79-0851c49c47a1@redhat.com>
Date: Tue, 14 Oct 2025 12:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] testing/next - arm custom runner tweaks
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-s390x@nongnu.org
References: <20251014104323.3023714-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251014104323.3023714-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ohCTl3Au-YBDNLhjlBTUasDxx71TmxIYqTNkI4zBgqE_1760438823
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 14/10/2025 12.43, Alex Bennée wrote:
> This isn't quite ready yet as there is an in-flight MR for libvirt-ci
> and the final patch has to manually drop a couple of packages which
> don't cleanly install. I don't know if we should deal with that
> upstream or in the lcitool metadata. For reference the two packages
> are:
> 
>    libcurl4-gnutls-dev:armhf
>    libglusterfs-dev:armhf

FYI, glusterfs is deprecated in QEMU since a while:

  https://gitlab.com/qemu-project/qemu/-/commit/b873463821343c6f702c4195f2168790b09cf44e

... so you could also add a patch that removes it from QEMU now, I guess.

  Thomas


