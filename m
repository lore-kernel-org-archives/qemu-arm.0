Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5419352wrv;
        Tue, 6 Aug 2019 08:53:38 -0700 (PDT)
X-Received: by 2002:a65:5144:: with SMTP id g4mr3673969pgq.202.1565106818653;
        Tue, 06 Aug 2019 08:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565106818; cv=none;
        d=google.com; s=arc-20160816;
        b=dkn02wcaahpTUDcVMGJsxvpVWDnD/lL7wOpAW1VcMrnqoWlg7krTn+DcmR/S1Lq4Fb
         ZVrppXpgxLGRbwQGIuaGbSSX2sd/7TBDYXZAou53/Hrm/iIw16otmUcengnrAC1hJ9ZC
         PpFcGjfX7u2DbMpp64uuJr+ibd1HFDRkggEjydUcyo1Yg57tPiIDzTcWKOw2AyALaKKT
         JXz+pg64ECS871E8B6NQ+oO6D3+iTXbG3nmE3jG/Uuorx3mS5tpLMX74h7h7qh+d9pWJ
         WK5sQHa1cjN4DNRO+wFPlur9IjDCySt5wvEpWtwOOq9Xby6cEKj3WUcFkm760EOdfZdk
         Twvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=SBXxT2xNMmL+bDeSQnhWV5BAJd/5Ujq99vRg/5LFopc=;
        b=IcdIDUeR0XYDgqkLNyHBYzztPsyyQMVgJVbzEWQVpHPf60/KPAZfG7eCQCTPMA5ZHt
         uSvt2KBcuAFrbqeuUgAO0I6fpLKvRBM4rfWYapYkjkDx1/aNIBEryNvm7jUs6rxrLjDM
         v5N4rGn87EynpJSVVWat2wLxC79A68yplNelPOLvLfgUm2JecAkArJln3g2EeUbw1t8k
         9c59zCPsLV1ZYRIajO0STqpBvzGDbG7hvpnfbiTsNcwN0dE0FQusv+4MYBDfgavFSYNj
         iIdb4KNkYTy0dj5FVFV/bnjmNuBP/5pU3CumkullEnRT76+8XL3G0iypNamD8Ww7S4nF
         /ORA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qrWOK/gv";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6sor68003486pfd.59.2019.08.06.08.53.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 08:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qrWOK/gv";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SBXxT2xNMmL+bDeSQnhWV5BAJd/5Ujq99vRg/5LFopc=;
        b=qrWOK/gvWsOR37lgZQkecB9ScjRyPeZNoQQ9qb8gKBIZJhwZ+L7DxbH2DEVkQ+yeTV
         /xoy1qdliQTpgcytqEIKIip+kOOHuZJBTqjOxBUIumOSH9dsj+esEyScd1B+5XUTxlJL
         myJbFgWn7++aKKbxHjP6ev3wr+HNZ5fKgNsL0WlzCy/ZZeEOGoQhrmjSZ/A33x2NVUiX
         BenNlFvitpGcoZr0bOFRLqWxUS1cJ+K4PFvCQFhDAf3+erZGAyMEJAbZNd9YtCtbj4Nv
         Qj4g/9JxuVbD43Q9R7HPdS4v/n65dI2lsR6rO6+4ja+U32wmGipxx0XnfW0ptRYM4hGf
         n9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SBXxT2xNMmL+bDeSQnhWV5BAJd/5Ujq99vRg/5LFopc=;
        b=oSTaCnTDeIMXaIoqkF5OXAKEBsAikFHSdQZ8m/6SlScVag1m21es93DAOlK97U0jrw
         t2sIu+KmuolreArqPkOBLXPgOsXLLmM1d6yDG0Lw1dNwGf0FZSZJLBL2mCwyVi3A1R+U
         uOJoNv/Tqay8jYbDOHBWxO5kDw0PID3MP/2H7IEbkH8TGdevY+vKxo0roaZ0wAjhAKci
         yb2ri2ZV23t8t6/7oHagjMsl/oEjXDhjBW1XVDvGim4YsuO9T+EaumFGI0wF7uBHs5wA
         i/nCg1Gxd3OKLH3TKxnplLGRPHptmTsCXe0Ne1INdZA1zaEJyu5eMaUIFcHwb1h9RMH4
         p1FA==
X-Gm-Message-State: APjAAAXWJeuKzpkXg28hyW7B+gxGB/yXHAc8yADk8SB/ipfldIdqD03I
	0yAsQuYe89MMlsikHjrDf4CK7hEEDz1OUA==
X-Google-Smtp-Source: APXvYqwTL7GfslmG/7We7B4urn1cnJ4oOsE4fRJtEB7xG10EOwG4EYpfxQerOvTyAprEYzC77A9g5Q==
X-Received: by 2002:a62:5253:: with SMTP id g80mr4325675pfb.179.1565106817593;
        Tue, 06 Aug 2019 08:53:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id f14sm7070219pgu.8.2019.08.06.08.53.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 08:53:36 -0700 (PDT)
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org>
 <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
 <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
 <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
 <92a7e54e-678e-cf4e-fadc-373e1bd6a41b@linaro.org>
 <CAFEAcA_oy067xK9p51cKwRDcCVTaj2JuqE+11jLS5L_gFFyzrQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <58642e3d-d54a-80e4-cbe2-6b5ab06b36ec@linaro.org>
Date: Tue, 6 Aug 2019 08:53:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_oy067xK9p51cKwRDcCVTaj2JuqE+11jLS5L_gFFyzrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 4HTtFdPHwS/I

On 8/6/19 8:21 AM, Peter Maydell wrote:
> On Tue, 6 Aug 2019 at 16:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/6/19 3:00 AM, Peter Maydell wrote:
>>> Renaming pc_next would be a cross-target change, so let's put that
>>> on the shelf for the moment. Maybe just put a TODO comment to the
>>> effect that we could consider renaming in future ?
>>
>> I wasn't suggesting renaming the cross-target variable.
>>
>> I was suggesting shuffling around the current names, and using "pc_next" for
>> what it sounds like -- the pc of the next insn.
> 
> Oh, I see, so incrementing base->pc_next after we load
> the insn? Yeah, that would work too. Though it seems a bit
> odd to me to have the target-specific code modifying
> a field in the base struct -- that seems like it ought to
> be purely for the generic TCG code to use.

Part of the contract with translator.c is that base.pc_next is updated.  See
arm_post_translate_insn.

The difference would be to update early, immediately after reading the insn
word, before decode, instead of delaying the update until the end after decode.


r~
