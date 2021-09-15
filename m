Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1408131lfp;
        Wed, 15 Sep 2021 00:11:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB8iHumVOs2fkQ0+4t2zY55eNYJNSRwJsETD6LNcJONbgE/7LzV80DUi/lX8mynr0d9FhJ
X-Received: by 2002:a25:b98b:: with SMTP id r11mr4235968ybg.189.1631689868226;
        Wed, 15 Sep 2021 00:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631689868; cv=none;
        d=google.com; s=arc-20160816;
        b=DXh1ihInCwBzisDNegGj/B7xW4U3ILG4fnw/KKhrvOCuZHnGjfXUMo5Wh3qbZurAI+
         OoqPKG/4ulxozR12kMPwvOe2o96CyJmhU6kVvI/fKmAvu9hVFJ90/cPEUheVISSK+93h
         2KEiohi6H9RQxocPzdzNmpnpExcBkYkNTr14KtiGWQeveVOjGpiucAOScxB01NUVo5bD
         8Iztl6KOAhafPrRvXrLCVyA/SrOEOMxoBNgogXueNO8uCqZV32HbZnDHKo68WKMyS3+N
         2U1e7SdIKO/908A8FGn3OZsS1n+EJMRecBpqsrJ+SwqsaOMicYN5OX2yqXBEmQZn18ra
         w/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+muqlBR3FeFgS0MIKSJSDhjayA6Aa8PPlxefEHtqpwg=;
        b=Buax5B5uWaz3Jb/wdmqfu0peMqmr08AIcT5HMjk2ZVS8Ftvg6uVHZK2TLJCiaU4TkU
         cG47tQ9GU/tWTqbzM8HErvmGysLY8zNqXH85gEC0JLV+Koa6nIGkatiwSzb+4cBQM0Dv
         PVJ1LZZI8TKAhw21Oim8C8+ezir5cq+fpIXSkdXj5SWGa0Dg9MpFB5t4m+729yAie3H0
         UynpbzUe72kio5jUDzonwQPsQ1heJ8onm18pIn4xa7csOLZoj82VaKJ/cx/bPh3fA/Xx
         zDDFtni+3+Tl5FgRl5G7Xh693Wk0q3KhCP6hDDvJiXNOa4evLII4Mb/PrWMxrpOJTZuY
         BmSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZaosdWBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si16261613ybx.77.2021.09.15.00.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZaosdWBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQP4V-0003S4-Gz
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP41-00032B-Tj; Wed, 15 Sep 2021 03:10:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQP40-0000ht-5x; Wed, 15 Sep 2021 03:10:37 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so2207752wrb.3;
 Wed, 15 Sep 2021 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+muqlBR3FeFgS0MIKSJSDhjayA6Aa8PPlxefEHtqpwg=;
 b=ZaosdWBt9ijHjQz0pC1HU1KTDiZQEYzFr0tijA7AiqhovpaiDEcXnMj7CRM6iER9K5
 YBpIAY/p1kU9EZBegTUw1UhdWIa7d8X7aeO2LF1X1WwnOV7fWhzUi6O7POzDRqNuQ0tL
 JldbFi8Sh64Q3qioigVxCPck+S0PSiDZrDWPG5bLdTJ3gXdazy24JPpFgOed3UjkXrvk
 W5UEZ7BZhEHpw9M6ZtYOzz07/441OgvZjMNf1k8Iazh6byrj+tdhEggA0A7+Iqp6EpUG
 gvO2k4C8xrIOhMEqJ2kuwa4jvd8qUO/Kz256GEyp3qovsPI52g0IN8zQDihSoYZ6Pf7v
 zYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+muqlBR3FeFgS0MIKSJSDhjayA6Aa8PPlxefEHtqpwg=;
 b=uQcST50W+FGwssurtaQKp4qyqqOjhtjKrFCAtLvoLfU0kA2cF+IiSKuIsA7vB4LhvT
 O+34oN/+yiaS7Y8Z0aZQuS4j1XdRyAF6hZHKqypB6G6rtgFORmmN/LcI8Wv+u6vZa3d+
 keyPcNBDHMbUwPNFnZj6edTs2aQfb49CIAevqZrxTsZuWEAZ/hQBwNx8NTCl8IHcHN2B
 p2nEPWcp//eZ5EvzxuxjiM79z0/3lXvU1Pxhxlg2mVQ0bV4kJHlb6+alaFpujxcYTTzw
 yiZoVooY0BzUc1YZCPm3UY2Xuo3x2eT6CByr9QqAt91puMlWZGaqanVTWYmY7e3P/z53
 dz1A==
X-Gm-Message-State: AOAM532pFA8o1X4NA8QpyTIcKKJfBoqlAQd9MLAkZ34IzTePGHXJ65gv
 wLlg45Ao2VHTcnVy4NYO2RvE1BPXThc=
X-Received: by 2002:a5d:530c:: with SMTP id e12mr3234135wrv.81.1631689833370; 
 Wed, 15 Sep 2021 00:10:33 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o10sm14166959wrc.16.2021.09.15.00.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:10:32 -0700 (PDT)
Subject: Re: [PATCH v2 07/53] target/alpha: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-8-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df099ac9-84f0-0de3-e739-ed55f4848f27@amsat.org>
Date: Wed, 15 Sep 2021 09:10:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-8-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MAonX7HN/Agv

On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/alpha/cpu.c    |  2 +-
>  target/alpha/cpu.h    |  2 +-
>  target/alpha/helper.c | 28 ++++++++++++++++------------
>  3 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 4871ad0c0a..d0cdda9554 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -239,7 +239,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>  
>      cc->class_by_name = alpha_cpu_class_by_name;
>      cc->has_work = alpha_cpu_has_work;
> -    cc->dump_state = alpha_cpu_dump_state;
> +    cc->format_state = alpha_cpu_format_state;
>      cc->set_pc = alpha_cpu_set_pc;
>      cc->gdb_read_register = alpha_cpu_gdb_read_register;
>      cc->gdb_write_register = alpha_cpu_gdb_write_register;
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 82df108967..9e3c80ebcc 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -278,7 +278,7 @@ extern const VMStateDescription vmstate_alpha_cpu;
>  
>  void alpha_cpu_do_interrupt(CPUState *cpu);
>  bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
> -void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
> +void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags);
>  hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index 4f56fe4d23..6ed80e8a27 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -451,7 +451,7 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      return false;
>  }
>  
> -void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {

Unrelated, but this code doesn't belong to helper.c IMO, but cpu.c.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
