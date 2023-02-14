Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1579398ejb;
        Tue, 14 Feb 2023 11:42:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+lso4tXjJJrheeCHGwWR6fH0z6STd7XtgIwRDYWoOPVMSzME7Ril8z1rJzBxpeSBYhBmDp
X-Received: by 2002:a05:622a:1209:b0:3b7:fafc:73e3 with SMTP id y9-20020a05622a120900b003b7fafc73e3mr6182039qtx.41.1676403772594;
        Tue, 14 Feb 2023 11:42:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676403772; cv=none;
        d=google.com; s=arc-20160816;
        b=x2swdUFUjEHAXThtWIxw8S3f2iGTB+H7Y2TclmtyOCfUvA5TbgAMK6X5VtH3qgf7GO
         n52iR4oJsfs8MqP9Ml+P8oQETQXlE3k0l8bxF1md5+h1nPOcxCM+TOzs05ZLhL38V733
         JrKEzwiP7/XTZC7Pt1Phov6auBKNoyxwygS8DLPOsvHt5QChIPAAMMCaw8MiN0Dg9Osd
         5HdNvWowqNrCVBfqgX3mL6QcSCqb+cY4iflqRr5dr0FC9ocV+6d2HUmj5ebqI6RcyaNf
         7IVWW/jSUpZLbtVOaAiKzwaYvzRdKsPOb3WOP/bC/u5Qkrb4r16lyULQ9rFsu4jgyDO/
         L2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature;
        bh=d0taNcI0BH7qm+otWN0m+SySACtsZfs01z6+3ERND1g=;
        b=Wa8aDV88xnnDmZ4WS94mHtrJ3k4OLuS01zDLL1iHPWq7lfuI9MVHQBILu5bK0zR+fk
         wnWRbdM4ifWPt3vDfNGMZ3X8VQ1xr82PLR68H86n48NWB0hJuS/86h/mqWqhhGvod24k
         W7CjVM9xQL4CY6F98HCLJfptK8mKo9R9QHE/BGhBvIWtP8qovV4jiw9Sooe1lHe9UuHd
         7qdou+OQ79X2Lg/0O7oU+XDRzp1kHZmq+/8hjGA/ZUNSe9jBRSjgsW+m4knvVHijHXsq
         /iQ4TdGXofbJaG/XreVWS/Zl5eyCLJ1k7pQPN0SmbmxOYZjUDfctZ3IRkPfbUVjyREqh
         bmAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hsLJyO0n;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a05622a174800b003b8328e179asi12509743qtk.561.2023.02.14.11.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 11:42:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=hsLJyO0n;
       dkim=neutral (no key) header.i=@nongnu.org header.s=susede2_ed25519;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS1CN-0002w8-W3; Tue, 14 Feb 2023 14:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1CK-0002rh-FD; Tue, 14 Feb 2023 14:42:40 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pS1CI-0004WY-RN; Tue, 14 Feb 2023 14:42:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0F09D218A2;
 Tue, 14 Feb 2023 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676403756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0taNcI0BH7qm+otWN0m+SySACtsZfs01z6+3ERND1g=;
 b=hsLJyO0nR61FgVdo5lNUKqHkfsKlmMuKgvzVc4WkTJIDi5Ubg6jC0oYAAHfw8c9in9skTY
 r/qGwPQng7gKN/D8lkra9/xIsTMrDHBeagi9Ch5nf1QVYFXCJGiRjsehZR1fzf3u3ZZ3yn
 XrS5uWQcA4oVyrnr+4sPT46E34CYH0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676403756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d0taNcI0BH7qm+otWN0m+SySACtsZfs01z6+3ERND1g=;
 b=i59v/GNaGQ3jbstcs/t62v038tfxDO2gdnT/bCbH/EkOwBM7gJTrJR8LdP9yjmIsLB1lf3
 dUWWWJP+y33AP2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 91043138E3;
 Tue, 14 Feb 2023 19:42:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zx5oFivk62NGXQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 14 Feb 2023 19:42:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [PATCH 05/14] target/arm: Simplify register counting in
 arm_gen_dynamic_svereg_xml
In-Reply-To: <20230214163048.903964-6-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-6-richard.henderson@linaro.org>
Date: Tue, 14 Feb 2023 16:42:33 -0300
Message-ID: <875yc4kp92.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Jdf9qWTPDQU5

Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than increment base_reg and num, compute num
> from the change to base_reg at the end.  Clean up some
> nearby comments.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub64.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 811833d8de..8d174ff6e0 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -277,32 +277,35 @@ static void output_vector_union_type(GString *s, int reg_width)
>      g_string_append(s, "</union>");
>  }
>  
> -int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
> +int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      GString *s = g_string_new(NULL);
>      DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
> -    int i, reg_width = (cpu->sve_max_vq * 128);
> -    info->num = 0;
> +    int reg_width = cpu->sve_max_vq * 128;
> +    int base_reg = orig_base_reg;
> +    int i;
> +
>      g_string_printf(s, "<?xml version=\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
>      g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>  
> +    /* Create the vector union type. */
>      output_vector_union_type(s, reg_width);
>  
> -    /* Finally the sve prefix type */
> +    /* Create the predicate vector type. */
>      g_string_append_printf(s,
>                             "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
>                             reg_width / 8);
>  
> -    /* Then define each register in parts for each vq */
> +    /* Define the vector registers. */
>      for (i = 0; i < 32; i++) {
>          g_string_append_printf(s,
>                                 "<reg name=\"z%d\" bitsize=\"%d\""
>                                 " regnum=\"%d\" type=\"svev\"/>",
>                                 i, reg_width, base_reg++);
> -        info->num++;
>      }
> +
>      /* fpscr & status registers */
>      g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
>                             " regnum=\"%d\" group=\"float\""
> @@ -310,8 +313,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>      g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
>                             " regnum=\"%d\" group=\"float\""
>                             " type=\"int\"/>", base_reg++);
> -    info->num += 2;
>  
> +    /* Define the predicate registers. */
>      for (i = 0; i < 16; i++) {

There's a info->num++; at the end of this loop.

>          g_string_append_printf(s,
>                                 "<reg name=\"p%d\" bitsize=\"%d\""
> @@ -324,13 +327,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>                             " regnum=\"%d\" group=\"vector\""
>                             " type=\"svep\"/>",
>                             cpu->sve_max_vq * 16, base_reg++);
> +
> +    /* Define the vector length pseudo-register. */
>      g_string_append_printf(s,
>                             "<reg name=\"vg\" bitsize=\"64\""
>                             " regnum=\"%d\" type=\"int\"/>",
>                             base_reg++);
> -    info->num += 2;
> -    g_string_append_printf(s, "</feature>");
> -    info->desc = g_string_free(s, false);
>  
> +    g_string_append_printf(s, "</feature>");
> +
> +    info->desc = g_string_free(s, false);
> +    info->num = base_reg - orig_base_reg;
>      return info->num;
>  }
