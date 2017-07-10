Received: by 10.25.44.15 with SMTP id s15csp3782301lfs;
        Mon, 10 Jul 2017 11:55:35 -0700 (PDT)
X-Received: by 10.55.11.134 with SMTP id 128mr5749109qkl.6.1499712935834;
        Mon, 10 Jul 2017 11:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499712935; cv=none;
        d=google.com; s=arc-20160816;
        b=AWfunKY2cvFlfHx/m2xAyBX/h01xQo3OUc2sbNgy+IIVn1PXL+giN+jttanYsXadRN
         GE8xIBLd0513QyNOsxCN0Ho7hryuqFaZZchjf3NVdR/Jc1RXDjTWzeOnTbIEfed4fPig
         nMSMmr1ecD2p8acFGuQYjs75dFakCUxP0c0cWK0n9MdbgP+PvH4eXMg7zS7aDcMN/evq
         cZZsbAo6xtp2esnzMlzG2ieWGIFMoL81gtz1OCEezuPqusE/E0romcxjEGeLg+wL83qy
         p2Qw2awWlrVhLmMiiUoykf6KUmnhlJ1CR4RFhW7wkcwUnwlkH3VSCcU4FqVGqL6USCVs
         LzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=L8Nh+Mi0CP3YaW6VnY1R/PSz2nqsX0r8VzIcBrJeWSI=;
        b=wYWIrhbykmMsUine5EKapLD/JK6r/6djuTQCpLx16TUzcmE8bDwR+VcerG2DKzr0Fv
         iLd446+g+mkpug7FGPRm/2uZN0ySRGb8ht7OW2HMVPnCVc/IgFTPgfZZlIi0CkVSH5ts
         u0kJeQ6cphhI+CNtDwhSwE1kVA5NUNlH2TH3y4h+T/aeF7mP5lu6ggn+ekQ1pRxp0heZ
         ej9Vj//0jVPNh2Acl+QwvS1cnI5jsfTxCCIIgUl7RSlqSH9aARvvHEYQca9liplHMCMP
         5SzcBqpwmmpklUyDSzPcIyXEYZFcaWOze57BeMYE7RcpnFQ8kaXTp9qLLkMaT/3scy26
         LWWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=adrPJ3s+;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com. [2607:f8b0:400d:c09::231])
        by mx.google.com with ESMTPS id v70si11304817qkv.289.2017.07.10.11.55.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 11:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) client-ip=2607:f8b0:400d:c09::231;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=adrPJ3s+;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::231 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x231.google.com with SMTP id d78so81781142qkb.1;
        Mon, 10 Jul 2017 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L8Nh+Mi0CP3YaW6VnY1R/PSz2nqsX0r8VzIcBrJeWSI=;
        b=adrPJ3s+Q302cWBaQtHBVGjharmpCH2kursvAqQGLR5Dr5OTLFNpPNzgJi71WI3D36
         SsNwnsaZB2XKmSQ+mlyrLPCargQGMRKucx4PWBLvdnjRPFMlpTM5pvROJvlfPtt/t4LX
         4L8FMP9pwIP3/g9E8LubqdeW1lCwQugo6WjXheEDS8BcgZlTurncdFYTwDix2qAKSvJW
         qRWO+zPVJHwgcz73lS4XjS9cPKazpwsAR12viBrIAYNr94VOXeptPAtJm6Xmep6uY4GU
         +hI6n9wjJeHM3fwOsSWZiPiuqoq8+JVuULqOL1P48WlgsGlJ4Dv8OpOIXCQXwMQpxZW+
         iduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L8Nh+Mi0CP3YaW6VnY1R/PSz2nqsX0r8VzIcBrJeWSI=;
        b=UuRijs3Y+RqNJnCxQsa3NWz4K6iQ26j0ew6Tk+DQvAUuaQCURXHA8G2aSKP2q3KTmH
         1lh8Rl4xIi6TfQpRZtVIppKNWU5w+uunAGr6c0i/eD1Rtm39XnGFQK0NppwbCYNSR22T
         9ZEpcPxq3s6awEI6Ka/9x0m80fwMWZqcGrnMP5SU8qsvCt4VynQJE5R2mRoc1Qh8sVYg
         yj7yzme2s4FQGP0QXFqBEbAwjmIJ55wblpuSq02svrRuGye1BdmEwYn2dE4oMKJwXz4j
         I8pE4Ls8Qb3qHdRIt+oYybD/aSklJTNVao+GdZzpBfQBtIYVvkvlGSBvBZyS5KAGdp0k
         71xQ==
X-Gm-Message-State: AIVw1100ZHkZ8ilh4NU0wZ8Rq9Kmpi4jCgxM2eHrhOfXpYtx7rK2U5QC
	XAxRmv1yhXZGzCucGgY=
X-Received: by 10.55.79.80 with SMTP id d77mr6201958qkb.155.1499712935333;
        Mon, 10 Jul 2017 11:55:35 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id d17sm10081305qtb.47.2017.07.10.11.55.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 11:55:33 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v1 2/6] target/arm/translate.c: make DISAS_UPDATE match
 declared semantics
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Emilio G. Cota"
 <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
 <20170710154749.13624-3-alex.bennee@linaro.org>
 <CAFEAcA8OjCS9=UJ6NV2_PgT7zciOmcnvrzpTY6FL55D8x965aw@mail.gmail.com>
 <0b397419-08d4-b29d-028e-fe196d8122a3@twiddle.net>
 <87mv8c9m3a.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <261b7f4f-d3dc-d23b-aeba-8709941de579@twiddle.net>
Date: Mon, 10 Jul 2017 08:55:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87mv8c9m3a.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: VHoLk+uunLhs

On 07/10/2017 08:35 AM, Alex Bennée wrote:
> Well this was more in the guise of having well defined semantics across
> all the translators. I agree just keeping DISAS_EXIT is cleaner w.r.t
> the ARM code.

I hope we can do that within the context of (or after) LLuis' changes.
Doing it beforehand is just going to confuse the issue.

> So without messing with where we do gen_set_pc_im(dc, dc->pc); shall I
> just cut this down to not falling through to DISAS_JUMP?

Yes, that seems like the best short-term solution.


r~
