Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2505941wrq;
        Thu, 14 Jun 2018 13:42:51 -0700 (PDT)
X-Received: by 2002:a63:931c:: with SMTP id b28-v6mr3637994pge.167.1529008971709;
        Thu, 14 Jun 2018 13:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529008971; cv=none;
        d=google.com; s=arc-20160816;
        b=zXhBai8e1WNSBuAuyiaglR1O0aPeCnraZQQ/a0u4uKne7neFc3kHoUUV9xj2+sPzE5
         njw7bNaDOPGJeavAsMCUBloiDARUFrSrrYPmDJIa0kRvLEpXbTrbIRtOw8Eeeza/85Po
         NJWxMGUI9LsrquGAooIQVBH6iGyZY0ECO/ZqURU5HF0SdCIaugBji5Smz7q4JF+8fUXA
         /gNJNDyKf3gd9l22cWTnnP/NHA2huRyMRquONWzGU7E2YSvYnMxoWrquyjZNvITRlja9
         oM0GR/pvrMQq9jpPwouaqosIZhRb1fqmJf8uOWjygaATMag8h/47VbtSwncGbkuGQ1yL
         qUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=CnYp2X+y1vJIsjwe6rS8EIHO1+BdqXTTX3POqbRIr34=;
        b=MGe9+PtvHbQF3FGsOx0ScU/vpg6HK28cKFWSQ+g6AJf6xbK1SvMifLoPiuDJ93Sgdg
         iExaPbSshAwXIV0Fp0Ur1FXopiVwBTN8zZd7ybYEaF8imn+IP9jwsacbomSFaB+ACE5M
         QuzuceaYdQtR1+9S2Evj3DHgHu27CSSRK7mXGySAM1HlLRfwimRPjl22ukdVhOlWk/5/
         5B5f4gX573E8dEdNGWH6HeKewycyUsI4aj9oU8S4YPclwRsO7PViaJNvBlvNF4Hl/Pyd
         isePySCfvoJAqQSvrPKyVgKdjxjDIepusZ9oi0kVwg6BTcJIOOjCj4QLPkfAFLC849tE
         nZqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbMyeazc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l9-v6sor2090789plt.82.2018.06.14.13.42.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DbMyeazc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CnYp2X+y1vJIsjwe6rS8EIHO1+BdqXTTX3POqbRIr34=;
        b=DbMyeazcLZGvXR+F6pwlghWe+rXWUp/vaQMor4o/quZG3WadqhJtA6mnXc4hxsWdTk
         iTxi50xwBhgXlNN1mP4/7kjfYnsC+BjwqgBQSlqy3zrjlCVzAAzP67+hkBEnGuR6OdZr
         PSNVHD0tm5gKz9IoWo0QNprbE/7Qh9MMTXIVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CnYp2X+y1vJIsjwe6rS8EIHO1+BdqXTTX3POqbRIr34=;
        b=irtM4NHqmXnH0UGxodzxjnWm7+vLoqcTZIr7LGvLk3d0Qh4xdC7ixomHslnrb9UkfE
         4FvaOz7oUceJpVUv2xZUKhEpb5SSqwFvGYzVS44Yby28CkI7u3+4daVQ7IkmNBJeuuod
         gw+AgIaTb2OBQcAXDDPhZ5Swh7dZuUdkGiJrLTWpcvgfBuyKt40AcD+CVDUZHmCkb2F1
         oogT6KS1sqeaLw2OO9jxTRLofLccqfbBeexIrcGhgZXsMrhKehjZljTAHAw9cZWvyIUj
         O13oZY+BgfLW0+nG28rHzhs3WIeuRN+bfkaoBhyPlH47hZbhsu7tU7SypJB5Tzy1h5Se
         +pkA==
X-Gm-Message-State: APt69E3+6P0mUcm/oiFLT3T3o068nq23CiRpxCQjdhpS4vYw/tJooVNl
	aQNxea9OcAE02mdgQ80lkip8ctWUHx2zfw==
X-Google-Smtp-Source: ADUXVKLxY+KAvoiJf/S49PkhVOhQPzMdxMz4ANvorlS+vhzysnXNoqPzWF7A82svyMQCrNVeBYsTKA==
X-Received: by 2002:a17:902:6b84:: with SMTP id p4-v6mr4681807plk.272.1529008971309;
        Thu, 14 Jun 2018 13:42:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id t21-v6sm16612604pfi.22.2018.06.14.13.42.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:42:50 -0700 (PDT)
Subject: Re: [RISU PATCH v3 20/22] risu_reginfo_aarch64: add SVE support to
 reginfo_dump_mismatch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4bf792a8-d946-4f8c-fb54-4440587ed50d@linaro.org>
Date: Thu, 14 Jun 2018 10:42:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xQuagASnQn3p

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> +static void sve_dump_preg_diff(FILE *f, int vq,
> +                               uint16_t const (*p1)[SVE_VQ_MAX],
> +                               uint16_t const (*p2)[SVE_VQ_MAX])
> +{
> +    int q;
> +
> +    for (q = 0; q < vq; q++) {
> +       fprintf(f, "%#04x", *p1[q]);
> +    }
> +    fprintf(f, " vs ");
> +    for (q = 0; q < vq; q++) {
> +       fprintf(f, "%#04x", *p2[q]);

%# adds 0x into every 16-bit unit, so for vq=2 we get

  0xffff0xffff

Emit the 0x separately to start?

> +        for (i = 0; i < SVE_NUM_ZREGS; i++) {
> +           if (!sve_zreg_is_eq(m, a, i)) {
> +              int q;
> +              char *pad="";
> +              fprintf(f, "  Z%2d   : ", i);

%-2d?  %02d?

> +              for (q = 0; q < sve_vq_from_vl(ms->vl); q++) {
> +                 if (ms->zregs[i][q] != as->zregs[i][q]) {
> +                    fprintf(f, "%sq%02d: %016" PRIx64 "%016" PRIx64
> +                            " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,

Actually, another thing that has annoyed me in the past,
but apparently not quite enough to actually fix, is the
fact that reginfo_dump and reginfo_dump_mismatch have a
slightly different format for Zregs.

It's probably worth splitting those bits out to helper
functions so that they must match.


r~
