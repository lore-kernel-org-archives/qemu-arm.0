Received: by 10.223.197.9 with SMTP id q9csp4062681wrf;
        Mon, 16 Oct 2017 17:36:20 -0700 (PDT)
X-Received: by 10.101.68.129 with SMTP id l1mr9387872pgq.4.1508200580627;
        Mon, 16 Oct 2017 17:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508200580; cv=none;
        d=google.com; s=arc-20160816;
        b=Iq5FkjvPmZYyzb3LfRlkEWOxU4v9fgnx6w2bHqJ9+M6DumbA0Fw9PPRYMA+Q2GEuwM
         ZNqFBrgqXOr3tQoQEXV7GYk8stRabpABBsgG9oGsBWYuNmC8LeSTcXTX/t3i6pMH6Pdj
         zUnqr/AC25HmIBEHe8qSDYsWdpb+zsoVKILJCgJf0yoI3ppFOqHmUGIqAvDqTH5NEjn/
         YwKGXelVUhl6tWCoT6VyJS3Tqpx4Wqx+CXpTHWijZEEbhfe66tgdgrdHisMZRMA1X1LF
         igXd/UerNZOh/fVPGANyLfKHyV/Gqt/od05kLuDs8Dqt00/idEKd+G9oghnzjdlhbeeG
         RhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=XsDea1Yyp2t/QOf3nR0AUxyx5k8x/uysmTILVRYu4kg=;
        b=yN0o8/q8kupMxbd85uFhze+XX31DfhL9Z6FQLLUiKTucvrxhZQ+CvXU2sBmjMUQQLZ
         VPVi+VJmK5LQGhpEDHhDwXjeDeEbyPRSa/J0803ttfmlCX6EYyi7XlWLnpr6pAjFigMJ
         YG7IjD3wqvbEN7NRry5meqCEhqnbZ7UAe5uL15ZCwjLz4o10uTs2UrFg3fFuQXHN2WOR
         vwd51DD1psNOPsMD+gMRpKx7715TZBGr8GnTdsrmWe2SIWdonvDqnBuBlgt66LuLEwZy
         00KvRhRvFSXBBmu0Y5u2eJmqx6oonEolfJDDVXBpK9bhSGyfTWh2Q3H/3mXYOt0h/KVn
         Dq5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ow3Xtoar;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e90sor1079743pfj.93.2017.10.16.17.36.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 17:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ow3Xtoar;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XsDea1Yyp2t/QOf3nR0AUxyx5k8x/uysmTILVRYu4kg=;
        b=Ow3XtoarQd27qWqK63iM2ZhgVips+FJIlRZUQP33fsGl29ez/rc2WBu727QKp/1HbT
         gb7LDldUFWaf1lEI9WzDf6GnJFLBMcp7l1W8TzcJA91GL7WxMoA0ypCOYTBlfebzPyVQ
         fEezkWmKDzwMIA+vPowC7Q6hAijcaa4z+2R1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XsDea1Yyp2t/QOf3nR0AUxyx5k8x/uysmTILVRYu4kg=;
        b=EeZIA9hn8PVrhP7cg/2ydhaZzlkR0EWNUQZWT+/0JtzG2MtBpj3b6r6lTOeQZs1DUA
         9hGj2PWOy8WLDOjSMUqJjVFhUjEXbWAWPhjoGedfebVfeVsUO1/4ZGAEeiAiK2epCQg4
         QMJvcE8gUItYoao6wakEJKeAJehDAxuknw7OLdAqSV2yHOgFLQUXuI/uMS8bReyBRQHd
         3Xa9iEBHGfc8Ik+vebyUMWX7sSXDEMi2QF50/xfaOLwsGPnkJvaLQuepn1tkuD3rdzn/
         Y5pLaQeeFyarpsG22m2oNd4GDMIoKO7SKAw+MgoUmiEwxdHObs8hrG66r9Eqyl6qxG0h
         VO1A==
X-Gm-Message-State: AMCzsaXJZnXnkWi4FomQrciFhUp0COqpCMVoqnca80fUp745Y5NsXC4o
	ivyS2MzIDPoYNpui4YThPWjN7Ofw
X-Google-Smtp-Source: AOwi7QAkDsfvljbfwz9k0Occx1QI1z7HJykHdu4c//vIo59QxZD1E0e/GiKW0xOPFv1PV21JpH52rw==
X-Received: by 10.98.4.67 with SMTP id 64mr10186121pfe.214.1508200579784;
        Mon, 16 Oct 2017 17:36:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id g16sm16970865pfd.87.2017.10.16.17.36.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 17:36:19 -0700 (PDT)
Subject: Re: [RFC PATCH 21/30] target/arm/translate-a64: add FP16 2-reg misc
 compare (zero)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
 <20171013162438.32458-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c2bca19-b11d-141f-4c9c-c02c673d3950@linaro.org>
Date: Mon, 16 Oct 2017 17:36:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oeHP1hGdt8LS

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> @@ -7792,7 +7793,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
>              swap = true;
>              /* fall through */
>          case 0x2c: /* FCMGT (zero) */
> -            genfn = gen_helper_neon_cgt_f32;
> +            genfn = hp ? gen_helper_advsimd_cgt_f16 : gen_helper_neon_cgt_f32;
>              break;
>          case 0x2d: /* FCMEQ (zero) */
>              genfn = gen_helper_neon_ceq_f32;
> @@ -7814,7 +7815,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
>          }
>  
>          for (pass = 0; pass < maxpasses; pass++) {
> -            read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
> +            read_vec_element_i32(s, tcg_op, rn, pass, hp ? MO_16 : MO_32);
>              if (swap) {
>                  genfn(tcg_res, tcg_zero, tcg_op, fpst);
>              } else {

I don't see a change to maxpasses here.


>          case 0x2: /* FADD */
>              gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
>              break;
> +        case 0x6: /* FMAX */
> +            gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
> +            break;
>          case 0x23: /* FMUL */
>              gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
>              break;

Belongs in another patch?


r~
