Received: by 10.28.71.27 with SMTP id u27csp811666wma;
        Fri, 26 Jan 2018 07:11:39 -0800 (PST)
X-Google-Smtp-Source: AH8x227UpJV7B5km0wyOe1pRmj5Ilc01rCc8Ql3ZHHA+fHinh+sJbIjo1aNOe2Posw5sQbFPkOER
X-Received: by 10.37.188.4 with SMTP id i4mr11404780ybh.338.1516979499771;
        Fri, 26 Jan 2018 07:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516979499; cv=none;
        d=google.com; s=arc-20160816;
        b=VzirZzj4PUNo8tTkRePWfxamrq2qOAuxTV5funiFbtpdk/KrNxjN8PhMwMFJpYgK+o
         TL+0YicOOxE8JM2NZVbWMpviemZmz/+PF1GGeQYaqdTcyn2vHfEyclwlC4j12AxE9Qai
         FbxzIglU9wNnfnPl5KXGjwPj5bKBjgWJjwC0L3Mb+pbo/TeuKvTMBWob9oR+A4KwvaW3
         i0TYwRTgWhYb5NY1eRpu9/Yj+B70gGo8hqYtUD6YDAWh1wCiRBNBoakpJ1fsENRo5YL4
         LI4dBoB4dHnRs2g+DAwV3yvXHFPbJaKAHd0VbRGoiIi0g5YUaPr2MtbjHvn2x7ecG13y
         es1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ebkmWhsWqTA0eQBrs8Fol+yuBpNDFuQnrTdFTEwjVPY=;
        b=fDOrcPqmVqmuxzcDYE+DwrenIbqWtxW42dpuY77OSI6boK4yTdZRsrdsG/S0iBwRyR
         yYC0GkHRCkKYmY+p/i64vAn0VfWXJFcU2HOBtzxTV4G8H2CqKCIhkvwqzm9bfK95J4jG
         ABxcsQkJrlKHjwhpMsC4rmleNEr6qeDB3Y7yI58MhBosGVz7JN/jD7y4zz8kFkC/qKAR
         0gxS26VGWwgT3TobogXfkfFiB/2i4NC4teeeZybymZ8E9MEpZZWfIRepMcb4Ja0z3fR9
         onWyUm9Or3rN8dpe5p90jhkeHyeppOQXlvylcnDtkbYDNVxlj7J0HIcpxKaTfkv5HJTI
         q7ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s8A8wX7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si930402ywb.458.2018.01.26.07.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 07:11:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s8A8wX7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef5fH-00024J-6T
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 10:11:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef5f7-00022q-60
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 10:11:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef5f3-0004tu-7P
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 10:11:29 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef5f2-0004so-Ub; Fri, 26 Jan 2018 10:11:25 -0500
Received: by mail-qt0-x243.google.com with SMTP id c2so1979719qtn.9;
	Fri, 26 Jan 2018 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ebkmWhsWqTA0eQBrs8Fol+yuBpNDFuQnrTdFTEwjVPY=;
	b=s8A8wX7qUzB/Pz1vCbCKGnJ4mQQ6qZDWksY0qGfJcw9V2Mky+G0RKUiIhWGOOuSpEF
	YdSUnyr+AtBESZL5oVNpJq9E9yRk6UBNDvBlwRghrDcGCPFvdYZEr4ensWMNcMKtaeTb
	yOpB1UAxnXhTTCasXa/tqqTXCJh3UIVr+e7C05klNEa/h6oCz+aI2Kbk3lz+1vt8mSni
	ifAE/MCnsWbPPfka1pK3Gbc6QbzKbIeEM3C+cNlwe+LfUuGEGJwFVGI0ha0VTXw+XtSr
	vfFavUCofsriHM/brdtvyMaudNXG+mKGdxkbo+rzOuaoCGMhaiUjgp4uDOr94n2nMh0c
	sRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ebkmWhsWqTA0eQBrs8Fol+yuBpNDFuQnrTdFTEwjVPY=;
	b=i3t93Z8BLMPjXdCc6S4MKWvprJ+Qtm7vFhP/VwfEVlRtc4RQFpMtwP14JNKRvmuxwc
	ayQxuIJNmm7ftsOQPGyq6AlHiWUEWFurj0tgTpN3jYQe1gX3r8Nkum4wPQHCeoGfP6ZN
	cTI5zcrOYRnMJya/NcPPXoJemm0UjyIhEfGh4yof3vj+brv8Ms+2mVEdME4e8WScc7r8
	515yf2eMLWZ2DzGSxoiOZyP+em+zM4Q6NzbZ0ZT759vTEsMhL1HmoYW6++ni3v7qVQmh
	quQ77fTH3W7vcwWQNKT6mewCSVtRbXYoh8BIsk1GY4w2FTifmbgSkL2b4bFTWUJkcIEw
	4gAQ==
X-Gm-Message-State: AKwxytfvobwQvzQzLwZm/h9YYln1mYqot13DJlBpJ0hbMppJCWVycGTf
	r+pO3GoCoggXvGEDxv0k2T64y6on
X-Received: by 10.200.24.8 with SMTP id q8mr23281385qtj.210.1516974076338;
	Fri, 26 Jan 2018 05:41:16 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 62sm3496363qkz.89.2018.01.26.05.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 05:41:15 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7bdbbbd8-d504-e565-30a0-4ce79c8121ac@amsat.org>
Date: Fri, 26 Jan 2018 10:41:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171218172425.18200-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH v2 06/11] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTFqgI9aaV2O

On 12/18/2017 02:24 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/translate.c | 38 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a9587ae242..1a0b0eaced 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6973,11 +6973,43 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>                          }
>                          neon_store_reg64(cpu_V0, rd + pass);
>                      }
> +                    break;
> +                case 14: /* VQRDMLAH scalar */
> +                case 15: /* VQRDMLSH scalar */
> +                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> +                        return 1;
> +                    }
> +                    if (u && ((rd | rn) & 1)) {
> +                        return 1;
> +                    }
> +                    tmp2 = neon_get_scalar(size, rm);
> +                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
> +                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
> +                                   TCGv_i32, TCGv_i32);
>  
> -
> +                        tmp = neon_load_reg(rn, pass);
> +                        tmp3 = neon_load_reg(rd, pass);
> +                        if (op == 14) {
> +                            if (size == 1) {
> +                                fn = gen_helper_neon_qrdmlah_s16;
> +                            } else {
> +                                fn = gen_helper_neon_qrdmlah_s32;
> +                            }
> +                        } else {
> +                            if (size == 1) {
> +                                fn = gen_helper_neon_qrdmlsh_s16;
> +                            } else {
> +                                fn = gen_helper_neon_qrdmlsh_s32;
> +                            }
> +                        }
> +                        fn(tmp, cpu_env, tmp, tmp2, tmp3);
> +                        tcg_temp_free_i32(tmp3);
> +                        neon_store_reg(rd, pass, tmp);
> +                    }
> +                    tcg_temp_free_i32(tmp2);
>                      break;
> -                default: /* 14 and 15 are RESERVED */
> -                    return 1;
> +                default:
> +                    g_assert_not_reached();
>                  }
>              }
>          } else { /* size == 3 */
> 
