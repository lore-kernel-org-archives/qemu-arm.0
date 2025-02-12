Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp973868njb;
        Wed, 12 Feb 2025 04:57:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWfmVCaz5C9rkg97BJQ9zLXNVx/dBDOS4M7oy7F6So1+/9pRDRQ6bav1fQwxvBCeZtZCV88QTIcGR71kA==@linaro.org
X-Google-Smtp-Source: AGHT+IHTpvoL94/lrk8tfSBBZo9qIsQ+XlEbHCcc/wBAQ/dyJISSW8jzaOnRSZR+vYEHjG+Z3btu
X-Received: by 2002:a05:622a:1983:b0:471:93cb:77d3 with SMTP id d75a77b69052e-471afe0ec3fmr43366691cf.2.1739365035724;
        Wed, 12 Feb 2025 04:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739365035; cv=none;
        d=google.com; s=arc-20240605;
        b=g3Tbw20WtZVp9y292FuzPK5ebJ5EmHaqA99fIbtxpjPkeIvyBQLZ5cjdLF9ksSP8/G
         s8YX85NH/RzSke3Rmzxm8SEJdy+Z7GjDgHfYaeKpXHyusfNEm56GzDMgciVGVMMZcPyR
         d2r71x+f52KC4sDrRshmnxIoTbAx8jQxFcd+/q5VyPxK0x7VDkTL5mVmfgKTL4bISAxo
         GrkFOnMO1p26rAj2m3N2FIYeH7UzLcpV9ngmje69iODNicbKf3xf/Xj5OAWSZgpsPoQw
         343+BZFgvsmochEVXJvZJXpv4hsKS3m7T4JQ595i3bs7133apNX3CwgkyYuD16B09C6g
         AxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ne1BlzP1YQdadKpVDm54zkVw4T40qs/CxXR7/xXJYC8=;
        fh=BrCoGxO/tyG6LJbwmZU2q6Oe7Sjbeiv9rF7AGadg6k0=;
        b=KvVjW0tKRbnZzUIZo0SkZd+mgw/NDFMDnfYQ/xJuOldfYdKC8BXdZXcS0kjOl27FLD
         Bg3DXDdyHLbq6iVnS4N2R/arSTtyjG13bLb5IdIkuULKrWJTZhvdTxx4O/oGGOH7k4nn
         n8JPPZCSEdPq8WfitpThQVlBwkC4DrCL/+EBDTBYHsqKZBeAwty9mglu68jaAH6wFeig
         bmUZ3YlbSfJfIm/q7H67OVkiMRfr/aTONbHyg3GApYGAA5P6dgUa0LFGbSEMvfDuDu2N
         DqK87urfyMvzCUFhYAgNfr38ArScsgMNXrs60u9yizMeInTP9Ps/jUtPoQiaWYLlBYLp
         V+wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DbGAKiSp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718c96e36fsi72679491cf.593.2025.02.12.04.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DbGAKiSp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiCIW-00012c-OR; Wed, 12 Feb 2025 07:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiCI7-0000uX-BV
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiCI4-0006Gu-Cf
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739364990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ne1BlzP1YQdadKpVDm54zkVw4T40qs/CxXR7/xXJYC8=;
 b=DbGAKiSp0oj1q2TF6UHqD5RVD0mwkcitHflw4pXPCJ0iy9y3sa9stbke0y3sz28ywiqEw1
 accgYiPnW5VtbGe0XN59ZYhVUSZkRqJlO1oZg4hA35HxXIOFa4wXrvnsTz8UatuetwB1wt
 s8Wl0wG5ED7mX9OBqXQYZ1ueGYe2mRc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-hIi0E_97PmqxDp8XuXu2Rg-1; Wed, 12 Feb 2025 07:56:29 -0500
X-MC-Unique: hIi0E_97PmqxDp8XuXu2Rg-1
X-Mimecast-MFC-AGG-ID: hIi0E_97PmqxDp8XuXu2Rg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38de0a98043so1342525f8f.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739364988; x=1739969788;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ne1BlzP1YQdadKpVDm54zkVw4T40qs/CxXR7/xXJYC8=;
 b=DsszbaS23+FOzhB462pSbF2uVmCP8YrHn4T905WxiPgKlg2Th9Y1sQ8jTZpTbGdPIR
 4F+liX+rZHstdc333lTysvJanMLEzH34JX1FJALD59DS8sfB8JCTHH41JWlW3B1RGff+
 vr8+B9pxK2MxgcpblDO11IGT2qc/AXBVMgtn1ury+kwI6BnY2Yt6+QHc+K7uTekegtIX
 3KMviPbVLl3MDpA6SmPvLQogw+v713GE2mXWYBHl8A/eRMqQqNlCMBYusD3Z7Wm5Zq5V
 EAVZdx/FRGB2Bbff1H1Cd9BeLUr2iJsU9HXiroWC2TAESiEGGNAa39v3Ey9KIcnxgblG
 HYVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzKTQzDAbSHuy3IyYYaakxpBXYF27XEcva9Zm8bXyBpYvp5zW+Fn62BIuqqGxnXsNDEfmz+D4WCw==@nongnu.org
X-Gm-Message-State: AOJu0Yxmyuh4VwMz9JPCBhxSRi5SJfDZ55UzlICCFTWxywvmxmHCXvrE
 ktCIY5k61UT2eirijIeL95LbxM6B5UyFl3UfVXMFPw8HGwsQcpQrUkl9YXBFOj4Gm1U227aVhKy
 GsGINJUXCw3voc+yeSPsHOUjm/ZKwPiZU15rmDco1ukR52sQW9A==
X-Gm-Gg: ASbGncuh6sB7r1whOdlHuCvXfPqqc8taS722WvonR+abSICooUeq1yqYS1M2S1Vb4/t
 ShfmlACG9P151vkDOVTD9ZM+4Lcj28+1zjUZb7P0NFFkXn1PM2RZRcr9NV/jx+3acycSUD3OOoW
 gIZ4cO0zp/TI27QqG7o8QpB3rYOm6HaTJm9VErvKPJp3ujB55iCTcSYo59Vh6fHUcGwsaEeFGBT
 5129YMJsmyBqnyeSlAKwW8ZJqQhJk9QZLqc3M66pdTwOppHLYb6fvEw/sSG0Ve41eCDAzDoaTWW
 hhz24lGPuX8WCrVOVwB3/TjaaJWpnsZiaw==
X-Received: by 2002:a5d:47af:0:b0:38d:d4b5:84cf with SMTP id
 ffacd0b85a97d-38dea256360mr2255269f8f.5.1739364987932; 
 Wed, 12 Feb 2025 04:56:27 -0800 (PST)
X-Received: by 2002:a5d:47af:0:b0:38d:d4b5:84cf with SMTP id
 ffacd0b85a97d-38dea256360mr2255240f8f.5.1739364987576; 
 Wed, 12 Feb 2025 04:56:27 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd4764880sm11720485f8f.25.2025.02.12.04.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 04:56:27 -0800 (PST)
Message-ID: <8e5050d7-2792-44af-8317-2dd6948f72c7@redhat.com>
Date: Wed, 12 Feb 2025 13:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] hw/intc/xilinx_intc: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212123659.52764-1-philmd@linaro.org>
 <20250212123659.52764-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250212123659.52764-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CgZhKmBBrtS8z8zJXrV8emXV2UghqPOejAmBzwnZVx0_1739364988
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: D7fl7eWb1Zs3

On 12/02/2025 13.36, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness for each machine using the device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
> index 8b44be75a22..55398cc67d1 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -111,6 +111,7 @@ petalogix_ml605_init(MachineState *machine)
>   
>   
>       dev = qdev_new("xlnx.xps-intc");
> +    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);

Do we still need a TARGET_BIG_ENDIAN ?: check here, too? ... the 
petalogix_ml605_machine_init() code still contains it, though big endian is 
marked as deprecated and untested ...

Anyway, assuming that nobody uses this in big endian anymore:
Reviewed-by: Thomas Huth <thuth@redhat.com>

