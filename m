Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp632992lfb;
        Wed, 8 Sep 2021 09:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/rqJkCe4CGoDLKBGqZ4M7x//y5uU8pyvqDaWjOYnXTUjVV3EFFZhMyfg8u0NmWWrJUTU/
X-Received: by 2002:a92:d18c:: with SMTP id z12mr623902ilz.59.1631119993469;
        Wed, 08 Sep 2021 09:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631119993; cv=none;
        d=google.com; s=arc-20160816;
        b=mErfcf/ZxT5d8ZUnl05l+UOmqz0CU2nzPnFqvvaAngnlc04ZA+pRYTdTrEBq70+QKW
         /HReO7oeGvHOQvDYZmJQblY2FmU3HF5q+aL+yNKMzsuhMu6FKTKrNpOeF9R8KAlGtM5j
         HOzZVLMD99msRZz+L0dfxgP4nKAK0gfj3+87CXyuI88154cxTUzDVIedrjpNQVLdJzaO
         wPruGDFgNT5K1LnRkjAbCqTDx27uJQSoMx0iEZWqiK90a3uYCcRT0iFiUq4jSzTBmV9v
         1TQXnaDoRtmTHMrP/HwpTRGBCnCQ1HpPbgAxlCMdFJCF+3m0NdKMeGxd1Ou0q1lazODU
         wuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BcElphGDfqHQThmO/GM2XXCCIiADOiCYWi6v3rJ7epM=;
        b=TyJofUknBYKuy67fjcZwqfZmpdH3WNuu3AhCd5lxc0Jmchc/CHyxA+pBkq1Y9VGNau
         EyB3jqCHMVmUrT+JEHtIyNAkioCPBBzmtAtphxTDBVQb88S5h1ycb9Z+XtJUHcqrDVXN
         uqFB/bxRznKYq/Zpsh+TAqbkWBG9pfSMRqkh4yy04rI5h7Hh9WIWS8wl9o11fmqzXW+A
         cCpvPtMKKZg2PspxrhxkHhuTS4DNmOUq5t4lbBXZGqZc49DdV3lhMUcNgBnLd8TmeqSW
         bbcLptxLmgVAZPS6ThBLNZRVTOqrKt2SnwLoAhifAuKuOzP41t8yZT3B5sC86UMzenYA
         KNzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pEvgFugh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c32si2324353jaa.44.2021.09.08.09.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 09:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=pEvgFugh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mO0oy-00055M-PZ
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mO0oj-00053k-7B; Wed, 08 Sep 2021 12:52:57 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mO0oh-0002rb-0n; Wed, 08 Sep 2021 12:52:56 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q39so3863524oiw.12;
 Wed, 08 Sep 2021 09:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BcElphGDfqHQThmO/GM2XXCCIiADOiCYWi6v3rJ7epM=;
 b=pEvgFughX7RW2CefzO+ps6ODCREGWyee2VYsoeAVRrMH7CM+lsoIIsWBtiMQKmxnSg
 hFn/QJxAuDbLGVtqry+WxjfpndT4ij4S/QNO8mCtp6dZbi65iElu/yFn/KFQV7yYEG+0
 EqV/d8buiYLnRicuoVmW8yMVGIG04U+kPYUb3jAyOuei5jWwQ9GWWYjcVtwOu/pFD1lH
 CtZzHrYZs1vdkx3y1++21RiCt+WTBuXf8BuSeCBOOfgx8oxhQL/wC/kn2LHOsFKqsHkb
 qNj4XkosJphNKICyE7xqmHkfPg3e3OOi35e0HZGX4p9upmL3ebXx0nn6hV2VPb6RfHHe
 dOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BcElphGDfqHQThmO/GM2XXCCIiADOiCYWi6v3rJ7epM=;
 b=JUV5QCLTTwe22Welb9ghLjFAO7FfJf3MYBKnJyJvdMRp0oTGD1EkRDIktqlgj454V8
 Im/4wkEbAc13L+EMgBm+9JmEZiQF//yZ8Rkl+U7oEQNdyHMVFfAiKtDOXotAmtCiJ3M3
 0S/5M3pFC4Ghdv2sX5vzz05KkX4Ac9v/ArqHpdlocnU+vtmEhmBWNbr7+SC0aotCosxQ
 ym62ZLl1Zp4nVmksURnUnGP3RWaenuw2XZ/NrgYHv2lqiBAO43LSazKOovVaU0v9bMuc
 OfZEeJ035BVar4T2O/my25tCaS+Qh4Jj667+Ct1HLeuV/kHYPga/AEvtWPcootEkQXdi
 A/6Q==
X-Gm-Message-State: AOAM531VckgyhhzHMSfFwqrOXksdADxWfotTcRRt1DXcoaBGa6C9Bkl5
 kpzVZS8VGEcbbHJDvRVfUCI=
X-Received: by 2002:a05:6808:2026:: with SMTP id
 q38mr3171820oiw.15.1631119972845; 
 Wed, 08 Sep 2021 09:52:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 8sm557261oix.7.2021.09.08.09.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:52:52 -0700 (PDT)
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
Date: Wed, 8 Sep 2021 09:52:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.922,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ESy2NhkhE1/G

On 9/8/21 2:05 AM, Cheng, Xuzhou wrote:
> Thanks Bin added me into this loop.
> 
> Hi, Guenter
> 
> I am interested in your patch and the issue what you found. I want to reproduce your issue on Linux, but I failed, the spi-nor of sabrelite on Linux does not work.
> 
> Could you share your Linux kernel version? It would be great if you can share the detailed steps to reproduce.
> 
> My test record:
> Linux version: https://github.com/torvalds/linux, the last commit is ac08b1c68d1b1ed3cebb218fc3ea2c07484eb07d.
> Linux configuration: imx_v6_v7_defconfig.
> 
> QEMU command:
> qemu-system-arm -nographic -M sabrelite -smp 4 -m 1G -serial null -serial /dev/pts/50 -kernel zImage -initrd rootfs.ext4 -append "root=/dev/ram rdinit=sbin/init" -dtb imx6q-sabrelite.dtb -net nic -net tap,ifname=tap_xcheng,script=no -drive file=flash.sabre,format=raw,if=mtd
> 
> Logs: there are same logs when I apply your patch or not apply. So I don't understand what this patch fixes, maybe I missed something? :(...
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00200000 00001000 "spi0.0"
> # ls /dev/mtd*
> /dev/mtd0       /dev/mtd0ro     /dev/mtdblock0
> # echo "01234567899876543210" > test
> # dd if=test of=/dev/mtd0  /* flash.sabre is empty */
> 0+1 records in
> 0+1 records out
> # dd if=/dev/mtd0 of=test_out
> 4096+0 records in
> 4096+0 records out
> # cat test_out             /* test_out is empty */
> 

It is a flash. I don't think dd erases the flash, so unless your flash.sabre
is all-ones you probably won't see the overwritten data.

Guenter
