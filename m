Received: by 10.25.0.144 with SMTP id 138csp1818743lfa;
        Tue, 25 Apr 2017 04:24:04 -0700 (PDT)
X-Received: by 10.28.69.147 with SMTP id l19mr1607196wmi.91.1493119444307;
        Tue, 25 Apr 2017 04:24:04 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id g78si3681472wme.112.2017.04.25.04.24.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:24:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id u65so24154681wmu.3;
        Tue, 25 Apr 2017 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YnVdg7QFYO6WUbUGk3x3+F2Xt1265n5TBNIY+X4bc6M=;
        b=Of0nSWRls+kCjkN7tpL/KUiVJrHKtmLf0UBeM9lKyazRT8HNiq2u1/k97S7yzOiqRB
         PVv27sucSsEZAHSaQO6GhrBzYZBdsFvVqPRrz+7P7v2m+tfQFYil+wdfJThTixBw2hSP
         E3b3qK6GJ6gKZF0EYLKqP3aB8afGTE8AeiTRbvlztAfgySjYRVu4EQc7jOt9UtI8Drkx
         DT1FTMOwW+Gl3RsDjb5K6ocjBBgZ5eOOl/EyfNQN1dI3VFVEnbcJnr4tqYcgLs0c+unw
         feIICQf9QubaNrfOwzNdE6cinby8flufGG/GRk/75mf13DaAxY6jB9a4wRpcByqaR9oA
         /0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YnVdg7QFYO6WUbUGk3x3+F2Xt1265n5TBNIY+X4bc6M=;
        b=d+9O8CFFtSJ4+HIAkxhGiWqY7/UMBVzHqaV5b6QJUdzb/088NwBIrdQnlXM3CEu7Hc
         LsedBAdUAxMiNZderS7gfoHQpmMCPaFZGXbicDPtNADooErmaRv6qe287hwR0XDIJtyL
         VQh9kNjskI93OkNZupsRXKTMMX1aQ68PQmn67lMc4LfWaXVwSbgnKoIzmSvXQXXyjb9m
         d1WmQOO7PwoBguIyspghTqpA7q2+ocOfzAGTGwGYT/nj/39TCWaxOwoo9brDRNRTE4Tq
         Ed/ys31kfww2HOZHwtPvuQGiU8CRTMkTFtZgmdYZ9Av7CZPTkUlDIKW1XwwxtQQc10Te
         EMXg==
X-Gm-Message-State: AN3rC/7Db2CNk78p/LTV4lmW51rBYTMLxq5gx906ZjVAtSjR+ijgMTQW
	1CnN7oyUgzxYQg==
X-Received: by 10.28.229.145 with SMTP id c139mr13175617wmh.107.1493119443962;
        Tue, 25 Apr 2017 04:24:03 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id c16sm25845693wrb.56.2017.04.25.04.24.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:24:03 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 07/13] tcg/i386: implement goto_ptr op
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-8-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <a844cf87-7df3-f854-31b5-3ac88ba1bf26@twiddle.net>
Date: Tue, 25 Apr 2017 13:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-8-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: GrpNS87bdGLh

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> +    case INDEX_op_goto_ptr:
> +        /* save target address into new register */
> +        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_EDX, a0);
> +        /* set return value to 0 */
> +        tgen_arithr(s, ARITH_XOR, TCG_REG_EAX, TCG_REG_EAX);
> +        /* jmp to the target address (could be epilogue) */
> +        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, TCG_REG_EDX);
> +        break;

I've just thought of an improvement to be made here -- move the xor after the 
jump (and therefore just before the "normal" epilogue) like so.


r~


diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index f6fb03e..f636557 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1907,12 +1907,8 @@ static inline void tcg_out_op
          s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
          break;
      case INDEX_op_goto_ptr:
-        /* save target address into new register */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_EDX, a0);
-        /* set return value to 0 */
-        tgen_arithr(s, ARITH_XOR, TCG_REG_EAX, TCG_REG_EAX);
-        /* jmp to the target address (could be epilogue) */
-        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, TCG_REG_EDX);
+        /* jmp to the given host address (could be epilogue) */
+        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
          break;
      case INDEX_op_br:
          tcg_out_jxx(s, JCC_JMP, arg_label(a0), 0);
@@ -2579,10 +2575,13 @@ static void tcg_target_qemu_prologue
      tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, tcg_target_call_iarg_regs[1]);
  #endif

-    /* TB epilogue */
-    tb_ret_addr = s->code_ptr;
+    /* Return path for goto_ptr.  Set return value to 0, a-la exit_tb,
+       and fall through to the rest of the epilogue.  */
      s->code_gen_epilogue = s->code_ptr;
+    tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);

+    /* TB epilogue */
+    tb_ret_addr = s->code_ptr;
      tcg_out_addi(s, TCG_REG_CALL_STACK, stack_addend);

      for (i = ARRAY_SIZE(tcg_target_callee_save_regs) - 1; i >= 0; i--) {
