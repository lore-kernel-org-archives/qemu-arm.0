Received: by 10.223.150.237 with SMTP id u100csp1479998wrb;
        Wed, 8 Nov 2017 08:32:17 -0800 (PST)
X-Received: by 10.80.151.186 with SMTP id e55mr1391533edb.91.1510158737865;
        Wed, 08 Nov 2017 08:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510158737; cv=none;
        d=google.com; s=arc-20160816;
        b=NWuDsCQNagdLsaJ0eEA6zZjkAmY4YEeZe8PuOTXMCAyvEVgvIPiYQIqSuGT54HTjYz
         Cuyudo4M6VpZVoGUr3eZhILlmhyosPZbLaEYN19160Vr4rkKYAHwfwH5J7I6Kec8q6p7
         PTd6nkoZtPonnJke6v4sVZBexqVOtCvhSj1ZLKfw05TCYTX9Gg2isQrXmOGKFjgmcEqb
         oNJIjRLtvzvlp+bblRw7pjdKPeqEuup5Mop5LqflH3b3dIFtrbjRZilKaTZJvtSWAEWR
         7nmnW1a0n2I1Sy6FpNcw7xd3ncmF1k7csMor6PXN5BpwmBZomW7nKugBTBguqp1Uf6W2
         v5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=5vmjCkDTc1nu3p1plhLGFcZrGcv9M5/Il3BydB5ZBVs=;
        b=gM0hpOKzAqkJfAkp2/Ch0TeSWEp/H/+Zq+22oTBcDAqG23I6Wk85saQlquju49vkEo
         oMXRbZvdhSEbM39+FYcmixtx8GMRFe+J29VFhoXeTkt7W0GRySTEQKkm5tLsqBHmGWyB
         Nkp2MVw7YTlVaJq+vx5W42OBiTzJcgQUwx5gVPWEuOxnISP1pPP05S2yHfdSNMEl9zzD
         L8/noEJX/cSbjVv+s3b5HQbCIfRZLy26QurYZqLApoixSuNUgbJAEDH2j3v+Tt0lYUQO
         qnU9WdP9RUy0crNmgOWwFiC9TtAbgilAC511pZAdVe1KkS3WPCFtE8BLKRm9GJfs8pxX
         GqzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rg/K5SLh;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h24sor2947176edj.29.2017.11.08.08.32.17
        (Google Transport Security);
        Wed, 08 Nov 2017 08:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rg/K5SLh;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5vmjCkDTc1nu3p1plhLGFcZrGcv9M5/Il3BydB5ZBVs=;
        b=rg/K5SLhgjUdg8OMFBHg3lR7mVL/5mpwqYTl+++LrRsuryIUqzkCWvfeQpZYKY09c9
         HYsJV5pR6dHjYI0H1tl0YHPc30hGMrZLLJkxoxSeTUgzmX5T4uSBone+Uqfe4aLzFZ4i
         tD2oxrW4dflwJF5pPeGO3Z5x2DngTZKCFxx/CI05io8YOwyRrFK+RLq2Xd2+C3CnZdXe
         KeqL0cRc5klYCuPcujCXrSMUigL5Gb2l/xFKCA2xmxlFnJqLmlFlgYwKDNg3dnp/EGDa
         bc2hOw6KeoZCX0lxOkjyZGF5Ac7WaTkzlrUw2GUDh6AqlZbaM6ZDhDuKeZAHeVQLlaCK
         QjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5vmjCkDTc1nu3p1plhLGFcZrGcv9M5/Il3BydB5ZBVs=;
        b=stLxNoqnNT6XXIM26ZCz1MB+tRH16yzyNmlNYxz3IqFjlEYJdS49Rk9/Lxq+aSHvgk
         6Pa9w5gR/8b8VPdg+MDdmS1rBCi3muKFs3z1xHvM2kYjgARo0MexTPmXmn1wtDiYYINQ
         t+LoOTh70P1WNptQyPM8x3LLPjFeU8FxiFwcwOMhg+eLTUZDJ73EHi6sFBXhVgx9H7h0
         cAMLu59TklauuA0KqJQ76U6brPkdHb481jAtmE07fdMMKgk5k3/fG6leVtLle0FOUrDZ
         lTZzhubKBMCBkbULaV2AY3rTjgXo+JzKcSycrtMx5uLhLCH+v+ii5t/hm7qwH4pGj5+l
         jGgg==
X-Gm-Message-State: AJaThX6Omu39FhTHGUPugFkC5iZHbKWPjxeU1s1Rm+uTNL5wcj+kIviW
	A47pI/V/ptrYiXB6j4hc84E=
X-Google-Smtp-Source: ABhQp+SBQkwkaamM06tGmaVKrsIGw6zPTj+7ekeSxGjQQAVerz2GNsc3serfCck0FjCAxz+SGQ+1nA==
X-Received: by 10.80.184.165 with SMTP id l34mr1359057ede.53.1510158737534;
        Wed, 08 Nov 2017 08:32:17 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it. [93.45.2.58])
        by smtp.googlemail.com with ESMTPSA id w28sm4474645edl.16.2017.11.08.08.32.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 08:32:16 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 2/2] target/*helper: don't check retaddr before calling
 cpu_restore_state
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 Alexander Graf <agraf@suse.de>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, "open list:S390" <qemu-s390x@nongnu.org>
References: <20171108153245.20740-1-alex.bennee@linaro.org>
 <20171108153245.20740-3-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <234690ff-ef05-9276-f6e9-2ecbb3d5964b@twiddle.net>
Date: Wed, 8 Nov 2017 17:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108153245.20740-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BtEw7Mq6WL3y

On 11/08/2017 04:32 PM, Alex Bennée wrote:
> -        if (retaddr) {
> -            cpu_restore_state(cs, retaddr);
> -        }
> +        cpu_restore_state(cs, retaddr);
>          /* Exception index and error code are already set */
>          cpu_loop_exit(cs);

Not that this is wrong, but while we're cleaning things up,
this call combo is cpu_loop_exit_restore.

You create at least 8 of these pairs in this patch.

> +++ b/target/moxie/helper.c
> @@ -36,9 +36,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
>  
>      ret = moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
>      if (unlikely(ret)) {
> -        if (retaddr) {
> -            cpu_restore_state(cs, retaddr);
> -        }
> +        cpu_restore_state(cs, retaddr);
>      }
>      cpu_loop_exit(cs);
>  }


This one *should* have been such a pair, but there's an existing bug in moxie
that should have restricted the cpu_loop_exit to inside the if.

All that said,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
