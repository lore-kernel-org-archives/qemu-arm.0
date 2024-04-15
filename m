Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1243024ejc;
        Mon, 15 Apr 2024 07:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnq1DbY0Iiv3/9vNvJrfF8X5dxV78DITFwVMAlyTI9eRkfQdeM2W1PTT6SygxkVrlVXpy+D8j6YdnF3nehWUfLqYpjJJwa
X-Google-Smtp-Source: AGHT+IH6j69O3hsCsZDmWbxwDNyZ23GqZ3tgfkXwHb+o/kT7oloPCz6uOqDRVD/701RBX+si8rXe
X-Received: by 2002:a05:6102:471c:b0:47a:2f20:1d7d with SMTP id ei28-20020a056102471c00b0047a2f201d7dmr9113525vsb.33.1713189762270;
        Mon, 15 Apr 2024 07:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713189762; cv=none;
        d=google.com; s=arc-20160816;
        b=g3dOFIjqIxG4BSlgC1gGSNfg43dVJAAJaTbTHWOv/XC+vH11PgVUeUaibmme0q8vTL
         BvRebX0oaRMLvTrY7NwDA/3knzGCZoRy1JrcRKmyqOF4oYbHRTR6MaAOfJzcj7VOO9QS
         YAtUu4F/YihkC3QbeRXymfUPJ5LyyL0emUNqdnwU0PJbKT6Y9Fk/iUli1POlC+4QOA2L
         gq/2BoIOtma+x0e6L5GCLVN0Kb0ORelszq5IoB3elkRDgsSMWgcdJqz1BUHePJp74TMD
         WfosSl6uS9GByUHJFvUJEh3Jmu3M6z4FDDM+RujkOpNGkHCuWXy7lF+z5YkLtyUGSAIa
         OEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pXDNlHlRADNS9aOWimzmw7tIndReKZC0UBS+/FsN9PM=;
        fh=raLU3eSOOG9ZTA9kPrBNTmD3b7bjjGDiUTjs9z4M0vY=;
        b=tbSHh8PmPqoswCq70hyhyBTMnK5Zl2r4wUE5+VovFlRuhapFnXvbqXfw9rXp7uKVcu
         UzgnO2ZyKGEQ/ZN95mnRBhodOWQip76pplkqnYUKPcC8zhy+F8tSsimps0CyokuTQM/A
         Leu1svBkbAiItfBVU28W0X02V8kG6PjiDqxz4Gmiu10/gZcNlBHFo8DCVcPnTNcr44LO
         UULt4jMlbpwFLfmN2Pbo0VEv4zJSNtW7I2Zol+Nap9wRAPjxreDWFeNO6OQDhTi+MXIP
         SXL/O4nlF6c0MjSw3k6TBggDyxlhB423I/fFZb+gE50P0D/FLZvx/rz21wk/Vyxpgxcq
         cOXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Is+PWbge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020a67e2cf000000b004786cc4468bsi1467666vsm.568.2024.04.15.07.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 07:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Is+PWbge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwMup-0004kt-Fx; Mon, 15 Apr 2024 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rwMub-0004j4-UG
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 10:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rwMuO-00008E-Cv
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 10:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713189727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXDNlHlRADNS9aOWimzmw7tIndReKZC0UBS+/FsN9PM=;
 b=Is+PWbge6cMxwucd9o+X3Q+WpKr6Us0eTUFtSeROrXu3STNA8BuhX7YFTPJMLUH4YO71sb
 gV4ao1pSDojB91Gh5o6cACAuiszCUBmIO+523R5S9k2zGnqiQ6Ozgyfpu9bOfTVJcopyW7
 PyWmppytTe6C5LuAnv0s7tRZI/KKeHI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-BWjGX9rvMCeDlPMoR8KaTg-1; Mon, 15 Apr 2024 10:02:03 -0400
X-MC-Unique: BWjGX9rvMCeDlPMoR8KaTg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-78eeb60e1fbso93204085a.1
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 07:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713189722; x=1713794522;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXDNlHlRADNS9aOWimzmw7tIndReKZC0UBS+/FsN9PM=;
 b=XPvMnVlwdTCvtlEOOa0kTAx7+iFpotoFvVhdjGiykr1TeI3iKEGGw3DihcbcuPpwoJ
 h/Dv6OQBQRL0JNqg16AzhUC3XOEDTMdgPtx73GZqpGDVVBgZVJPhRG+0mGbmRHQ0ZOm0
 Q3cmLL0ToA1agRpJtZsyoegN5PcFRNP2c13MUJhql/wnRia3Ife5eNAvn0Kdh6su+cAG
 162dJjyCvWJva1q9AM+ivLlo12PvPETkguEuAFLvBQxxC4sQDDa6KCXYzVKla427wOKK
 QevzOnainlGm66XDwhKYRV1xC14/YpoSmYtJrx+Z5WidTJvEw/CUqoLEHTF43lZQNRFh
 cDgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7vMJe3W1UKH2Yjk5H6oyLwmyBfPif8oc3vBJpLf+KC1ezfNIfOKVQ8BJnJ+Wm+VbqmBuFIHJkIiXG64vDTVLaTu1K
X-Gm-Message-State: AOJu0YyFaTExj6ew1vqAhZmn3EmbQNey6QhFdYMJj15eqekpklTBivf0
 PPZUdtA3gxyrEXST6AaWUtLUoIruC7l2pT5PqH75BIISBSsST30qxd04lhjRbXnMQuuGdKeGWeX
 49R3uFGrSVngP8jNGInH5DtxD8DFQbB6Yaj0xBTZyo7dvXSfKpg==
X-Received: by 2002:a05:620a:4482:b0:78e:ddf9:5f5d with SMTP id
 x2-20020a05620a448200b0078eddf95f5dmr6840895qkp.18.1713189722237; 
 Mon, 15 Apr 2024 07:02:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:78e:ddf9:5f5d with SMTP id
 x2-20020a05620a448200b0078eddf95f5dmr6840843qkp.18.1713189721776; 
 Mon, 15 Apr 2024 07:02:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:d55d:ba01:adf2:d3ae?
 ([2a01:e0a:9e2:9000:d55d:ba01:adf2:d3ae])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a05620a0a9700b0078ebb13a03csm6347225qkg.67.2024.04.15.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 07:02:01 -0700 (PDT)
Message-ID: <071b84be-ac31-4b64-8514-a5f4ec581077@redhat.com>
Date: Mon, 15 Apr 2024 16:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] hw/vfio/pci: Replace sprintf() by g_strdup_printf()
To: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-3-philmd@linaro.org>
 <20240412092546.348163c0.alex.williamson@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240412092546.348163c0.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.185,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8vutWJKvD82r

On 4/12/24 17:25, Alex Williamson wrote:
> On Wed, 10 Apr 2024 18:06:03 +0200
> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> 
>> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
>> resulting in painful developper experience. Use g_strdup_printf()
>> instead.
> 
> Isn't this code only compiled for Linux hosts?  

It is not.

> Maybe still a valid change, but the rationale seems irrelevant.

I agree the commit log should be rephrased.

There is also a v2 doing a different change :

   https://lore.kernel.org/qemu-devel/20240411101550.99392-1-philmd@linaro.org/

This is a bit confusing.

Thanks,

C.


