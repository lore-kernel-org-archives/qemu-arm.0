Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp355239lfc;
        Mon, 2 Dec 2019 10:44:53 -0800 (PST)
X-Received: by 2002:a62:8249:: with SMTP id w70mr50468pfd.253.1575312292977;
        Mon, 02 Dec 2019 10:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575312292; cv=none;
        d=google.com; s=arc-20160816;
        b=JHvRwM48I0zLufBHA8tUfueCh9NR+rUavxFhRKARZFl+qRHSLYV1ZCEzoTvXOLqStU
         ZDmDwAK9wP/2Q5p2DeJSh4QlHnavaH82E8h7Msybo1ZDhweIl8oT1xC5bqf9JdUD293B
         KfonbAXKkUzVw/hvA3cxJKCxbPhZrwadHVcxl1N5raticpTPs9a+YaJtpPFm5xi3bRfe
         e3G2b5FA6DDSTks/tLs7Wro+ytIZGBCHspizFvr/9nFwUiqgVQEKfeRHcZ9H/z4Yuu0z
         YyFcCLrZaDckGNVw/p2fN4p3mPzoMI0ii8RQb2YI3Uh9SpZgUHEIhoLby6kwzse6MEUf
         hI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=HWDGnAwwg81AxYaByamp6Musnv8ydCk1iaAOmLWCwrE=;
        b=c3n7CUfLPxhpycW5pnrBilBeRQN7bbqwFfCqvVUDHPVaJMVx4YzjX90kAhNzxaOI/Z
         7wNK1RIQleemKw25gMTrz8oks9voxWwUBcxhMLLR9EjoC8xtBgXksHzUyhIs50tre8f6
         3bbrlpD25BCtJDVexWCXZKZ8O7HreLyXqyn57SjjyJqcQGSYq3wfmPdTwOnkglNoeG6K
         VGfitZRZD0gbDrwzy0mjqtYDj+LRepR09kxcCkWSY85VuGRgAt5uANFtCwJSbeZiczBs
         a8UkkFUIvPzPuYKxg0oSQ78Bs5uijwMGcWwWVDqUfr+HGnPOR193SvE0np5jSO4DDvgD
         XUIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSLWJGXb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p11sor508306plo.47.2019.12.02.10.44.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2019 10:44:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rSLWJGXb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HWDGnAwwg81AxYaByamp6Musnv8ydCk1iaAOmLWCwrE=;
        b=rSLWJGXb+1EonvOcABrla7OAsCYaMeVKhgbWx2DrzHkhqMhrA5ThHU3rjD1jCRemnL
         L8lDdlhmIJVoHMJzqk7zyWO8Ws6OuCV3Kgj/1nXz4QKckwPGdwVy/F5YkjeVacP6FXm3
         IM8ZV60Sce4kYfUMdpeLahuiC1C26cAOsZgtRCR793Y7jnFzQidKZ8lcTWMknmo1GqpS
         FsZLTexy2ANHeb1Sh4Eurna5nf8wPblC8W1imp3KBsxJeUVFdEsFtz+D7fu+3+cj0ssh
         7CjHWw4cG7zWfR3D1FuvmIrYjftYZDGeKp9hv1F0Un6qaBkuYlNm3sn5TJIn059svLS5
         lHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HWDGnAwwg81AxYaByamp6Musnv8ydCk1iaAOmLWCwrE=;
        b=cwhrCdjoyiRi0zPqWviusKqAmk1ML7cTYTsUAAJ2Vkqb+wzFrP0pqAYLG4KQDTCPxr
         HvbVnREgf1f2yRPjHUJbfe4L703ylg4TtBzqkBM0qTM+vV3GFttiaK5Ovti/v0H8zk/r
         VgBV9P7DCPYuN1LpNBI6V6jKaub4WEuSZOZmlLfYOK3KZVfms2WawgBLBYT0SXrUtXbT
         Ht09UzcicVtraM4tYMK293b7ejzfffll5rEDVeM2C+zvqzC2srQ5wQMWVS0umCrckXNX
         I5avc/3Fu0mtUfCU1bUn1N52tOK4pR8lih3XtDWNXR3j6GrHgyCN/OgsHSwOfOKlVxEC
         1g9g==
X-Gm-Message-State: APjAAAVyxOynBInhYTneDkyQqRYugVpHNmFlHwiE/yaMAa8IahfPDHUP
	M60tPlhJcVvVRI2LVsw+4jGCdpEM
X-Google-Smtp-Source: APXvYqwfGoV4Eei6umuPI1vB+vYJebvtTioHWlPD277zk+ea6P4XzzXOIzRXazT9wXW9z6tQ2ETiPQ==
X-Received: by 2002:a17:902:7784:: with SMTP id o4mr672107pll.176.1575312292289;
        Mon, 02 Dec 2019 10:44:52 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id d1sm213069pfo.31.2019.12.02.10.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2019 10:44:51 -0800 (PST)
Subject: Re: [PATCH v2 12/14] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: alan.hayward@arm.com, luis.machado@linaro.org,
 damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0bf23c3-3bbe-ede2-3446-4ed2622d3b40@linaro.org>
Date: Mon, 2 Dec 2019 10:44:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 45W/D/iRk5Jd

On 11/30/19 8:46 AM, Alex Bennée wrote:
> +struct TypeSize {
> +    const char *gdb_type;
> +    int  size;
> +    const char sz, suffix;
> +};
> +
> +static struct TypeSize vec_lanes[] = {

static const.

> +    for (bits = 128; bits >= 8; bits = bits/2) {

Mind the spacing in the binary /, or bits /= 2.

> +#ifdef TARGET_AARCH64
> +static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    ARMCPU *cpu = env_archcpu(env);
> +    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
> +
> +    /* The first 32 registers are the zregs */
> +    if (reg < 32) {
> +        int vq, len = 0;
> +        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
> +            len += gdb_get_reg128(buf,
> +                                  env->vfp.zregs[reg].d[vq * 2 + 1],
> +                                  env->vfp.zregs[reg].d[vq * 2]);
> +        }
> +        return len;

This is tricky.  The "standard" ordering of sve vectors is a stream of bytes,
in little-endian ordering.  This is how the hardware handles things, even in
big-endian mode.

I'm not sure how gdb is set up to handle this.  Probably it
doesn't matter for now, since almost no one uses BE, and can
fixed later if needs be.

> +    case 2 ... 19:
> +    {
> +        int preg = reg - info->data.sve.fpsr_pos - 2;
> +        int vq, len = 0;
> +        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
> +            len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
> +        }
> +        return len;
> +    }

The byte ordering of the predicate registers is similar.

This output does not appear to work for vq % 4 != 0.  The vqp type is defined
as a vector of uint16, so you'd need to output in units of reg16, extracted
from the uint64_t as

  extract64(env->vfp.pregs[preg].p[vq / 4], vq % 4 * 16, 16);


r~
