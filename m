Received: by 10.223.172.38 with SMTP id v35csp3703751wrc;
        Tue, 26 Sep 2017 08:22:00 -0700 (PDT)
X-Received: by 10.200.34.28 with SMTP id o28mr17031060qto.184.1506439320849;
        Tue, 26 Sep 2017 08:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506439320; cv=none;
        d=google.com; s=arc-20160816;
        b=aBm0symRpo4m76WvcRZ79k90h0sIjka3rjUF+02493zbJoeQkb3mtgU2tqUaz12qty
         yTP5867AA6mDB+cJZi2yQrrcolDyOXmRjwQW86S7OO3ZGcJWLWGcqtOY7PyamV9F7Cfw
         EixBXC0MGftkq+/DbUz5NMxIfdT3T4lehFEqQpRvm2Dd5nL7EByVdJrmCDWCrz55bopN
         h5WcnyCwpWuxCs4jkbmAgLNkWDk0W3qtOqj1XNWJIDvjOlDBRnwcguj7BdfAjsTAWsvJ
         vYGmcakNhRCAaQwx8ViUB58zicPRYtpf08dwgtuoSleIEmqcUyQXVVibjdi/8ML2M7jT
         0suw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=QhH+NzC7s7pyRpsaJKe6GJ4T1mGMun5EkDjTqGtW78Y=;
        b=OiBuQwwXLO4hRyaUX7EzgomuT+LGF6aMeRZhBI7+8dcSXuJjm1uJl/D2uqxcza+Ulg
         oZluyT4EYoJIqkdCz1s+G/snRsTozZ2UsxyFJNKPeLyzyAb3SE4qB2LlUrFWI2gGD0J5
         blvU9a66YwQ01ZqYvZ800FADv/gMZY/pUvwFgaaCCxEgmKr0nekSQ6o9qlFv0iQTMWYs
         lHziJmAjtCcMV3yCwPHbVmwILIJISuLqg+OSIIlRSyE8VHH7Ymnf6GOr2Xas5QsiSfOP
         YiUyQ2l8Lmhu1thc7P1OmIBJ65mmjv7v7UgOMJWy4KInIzOMQjJeoaGgLWX7mtwNIohs
         w0og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXBo0qb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u69si6579566qki.554.2017.09.26.08.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 08:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXBo0qb5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwrgM-00074e-I0
	for alex.bennee@linaro.org; Tue, 26 Sep 2017 11:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dwrg9-00071P-FQ
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dwrg3-0000Dj-CI
	for qemu-arm@nongnu.org; Tue, 26 Sep 2017 11:21:40 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:33366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dwrfw-0000Bu-0q; Tue, 26 Sep 2017 11:21:32 -0400
Received: by mail-pf0-x242.google.com with SMTP id h4so5143984pfk.0;
	Tue, 26 Sep 2017 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QhH+NzC7s7pyRpsaJKe6GJ4T1mGMun5EkDjTqGtW78Y=;
	b=dXBo0qb5m03dXw49F3A2f9ovDUyUeJLHAnePlOCF/dhRWb7/8YUvgsJ5G7KzFLA+Uv
	VuiDOoD2SBE0M5C/mGC6MtVHVNYoF/6cqKLQGU94y7Up32camSlxYwr4V5FJU6o+UlLR
	H2GmiE5NfLrpYz134nWFcedXOv+/IHW9+NrCYbSFnbtZO0vcnp5Wn3by8VaHoM9a1e1N
	XZRh5nEnOL1CGa5oSQcVoQZL3gQgiJotGtKiMxPkaw8JXrSeKIXzxUQz2CJbxcnG8KgJ
	k/SGsNVUvrwYZLUauSxW6NjcLlDD3LoBcbCZuNWkf6C4BV4REQPJWdnyRRezXYn9xt6I
	XTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QhH+NzC7s7pyRpsaJKe6GJ4T1mGMun5EkDjTqGtW78Y=;
	b=PI8R9slFYvV5SErSjPWosVNfe03VRY/ZTNnuTVNg2UyaBMMvK+g3mI4eMEFF6vkcnA
	BsKEk98Ni/JrGXbJLratXsVJgl4VwjunsZMLOzfZC5RMxdTN+ad7PjdiMlrkZwJwWo7Y
	hnY8CurrRo5CfovK2391N1FuQrfGZvSOfZGtQKt0uP90VEoz8YXJl401VzAwdeAc3EyE
	6UioXgVUqwKVa6UCjneICzCQzHS8VZw5/BMyL5qW9I+xPxerI+x+8xv2eCUCYC7/9O/R
	p42t4ihPZuK4kK3Gv3dcCyWyFjBipS7jUBpFO0sKx0YIR6Jqy8oEEXr/J8jm0A4sHZnZ
	F0eA==
X-Gm-Message-State: AHPjjUho2zm619z1Gn0WXd0betFdPpNI2ViEi7yarbyUg1rTXakQ8jIk
	cm3V46N9A2Dg9ZCdzf3qIrSJ/HKN
X-Google-Smtp-Source: AOwi7QBP+iK2v9hDvQGTd+YXc9wzrcvJqsWTiCDrh6Qa69At28iwA86oG4d9+9XLW6QlVv6WwI/0iQ==
X-Received: by 10.98.157.74 with SMTP id i71mr11366570pfd.168.1506439289242;
	Tue, 26 Sep 2017 08:21:29 -0700 (PDT)
Received: from bigtime.twiddle.net ([70.35.39.2])
	by smtp.googlemail.com with ESMTPSA id
	h90sm19110544pfj.32.2017.09.26.08.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Sep 2017 08:21:27 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d591fe76-6305-e082-3dc3-b53178c0ee5d@twiddle.net>
Date: Tue, 26 Sep 2017 08:21:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [PATCH v1 8/8] target: Replace fprintf(stderr,
 "*\n" with error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, armbru@redhat.com,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>, alistair23@gmail.com,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D84yCGvyInlk

On 09/25/2017 05:09 PM, Alistair Francis wrote:
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 38a999e6f1..8847005984 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -138,7 +138,7 @@ typedef struct DisasContext {
>  
>  static void gen_BUG(DisasContext *dc, const char *file, int line)
>  {
> -    fprintf(stderr, "BUG: pc=%x %s %d\n", dc->pc, file, line);
> +    error_report("BUG: pc=%x %s %d", dc->pc, file, line);
>      if (qemu_log_separate()) {
>          qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
>      }

Eh, no, this should simply use qemu_log.

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 606b605ba0..a3da22580e 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3943,8 +3943,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
>               * allowing userland application to read the PVR
>               */
>              if (sprn != SPR_PVR) {
> -                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
> -                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
> +                error_report("Trying to read privileged spr %d (0x%03x) at "
> +                        TARGET_FMT_lx "", sprn, sprn, ctx->nip - 4);
>                  if (qemu_log_separate()) {
>                      qemu_log("Trying to read privileged spr %d (0x%03x) at "
>                               TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);

Likewise.  And all the others.
Perhaps we should kill qemu_log_separate as a bad idea?

> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 10191073b2..9f95410e53 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -438,7 +438,7 @@ static void _decode_opc(DisasContext * ctx)
>  	}
>  
>  #if 0
> -    fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
> +    error_report("Translating opcode 0x%04x", ctx->opcode);
>  #endif

qemu_log.

>  
>      switch (ctx->opcode) {
> @@ -1799,7 +1799,7 @@ static void _decode_opc(DisasContext * ctx)
>          break;
>      }
>  #if 0
> -    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
> +    error_report("unknown instruction 0x%04x at pc 0x%08x",
>  	    ctx->opcode, ctx->pc);
>      fflush(stderr);
>  #endif

qemu_log_mask(LOG_UNIMP, ...)

> @@ -1940,7 +1940,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>          disas_uc32_insn(env, dc);
>  
>          if (num_temps) {
> -            fprintf(stderr, "Internal resource leak before %08x\n", dc->pc);
> +            error_report("Internal resource leak before %08x", dc->pc);
>              num_temps = 0;
>          }
>  
> 

qemu_log.


r~
