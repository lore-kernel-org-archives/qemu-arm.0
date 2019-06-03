Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp814176wrg;
        Mon, 3 Jun 2019 08:43:15 -0700 (PDT)
X-Received: by 2002:a2e:2bd7:: with SMTP id r84mr14378716ljr.91.1559576595221;
        Mon, 03 Jun 2019 08:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559576595; cv=none;
        d=google.com; s=arc-20160816;
        b=WqzvuEFdmqiNvoFUjz0c4E2LzbEZz+mAkxlreQYY4Dieu2R6Iwp6yR34MgRG99KWZe
         5V73Ac/Z2sEZxFYwTiAgWdgeQqhXOXW3xkA2S5YJU95NlUQcTmytfuaotBfxOUFjdT5f
         +LUN17xWyFmB0SEm9dc5WkNgyexg3R2qs9rcILyyb6gsBJ2FSSr32AtT19K8HeKn7ww5
         fj3WckuYeDxqrCBszC/KNK32Nfb8nQht6ADRrf74PedkGJJl0qLAtVBFsNOKneVfzNTw
         s0v9fAkMndSi5oWNHlRcl4zobSTyx9Oj3JmEV2E5eX2J+hUj3fyzDjNM3NRnYxObRxWu
         oOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:content-disposition:content-transfer-encoding
         :mime-version:in-reply-to:references:cc:user-agent:date:subject:to
         :from:dkim-signature;
        bh=oSZhidXep9ZqP/yYb06ujCa4jLpPDdZ3fQEzb4ebxeA=;
        b=gRhXCp6nAEZhVpzVQEBZgRhWWeBUAHdtXWrjjQGYMoX9MOCF5Pg6Za9DpQ29lMIF5B
         HpJvzdBxQ1vl/0XuYa78PKmbSxP53li26UvWSUcLCxET5ENYZZ8PZhRh2g0cQaUdhb16
         u9SMgT/oYjVKfKMRK1gCDSABW9/vvQVmJLHfr5cBD3Jd+XMMnkm4qk8Jyg3+TP/+qHwt
         0WFeFNB0I+hl58vWKHyIadi83atWeQAUrecDVmY5lLbszeFFQYj3W8r5YdylxzkRTlBJ
         ZNRPZfpQABFukRv3Pq0AQJKfXFdYE+pH4/HsFkopGkW7FuuLqaJWbRt7gOI8iHvIDbDQ
         vNKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=K3NvzhpR;
       spf=pass (google.com: domain of randrianasulu@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=randrianasulu@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <randrianasulu@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p25sor706499lfo.24.2019.06.03.08.43.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Jun 2019 08:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of randrianasulu@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=K3NvzhpR;
       spf=pass (google.com: domain of randrianasulu@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=randrianasulu@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:user-agent:cc:references:in-reply-to
         :mime-version:content-transfer-encoding:content-disposition
         :message-id;
        bh=oSZhidXep9ZqP/yYb06ujCa4jLpPDdZ3fQEzb4ebxeA=;
        b=K3NvzhpRLI5Em/Y4B58Yi0W2IO+q2FNksM2oj1PQHj8Rsk8h/seJURnt3Rx59Woq2t
         gF4L+TgVNYfDjHTJtYxVlwGv2HZ12Bs9DFYkt2iPaRnMP6A5K8IsWC5GCU4gvnuYJAg4
         3SO0gLoYr8ZZcYixBkc1Lk1b7vVG2m+mzGq6v1vS1Y0e8vcgnXE/N+/pUia9qS09/qri
         VFqeb7Q/QoQAE3l+FvxeXZdND/wqHDQUHtDWyfX7U8SPgj4b4+o8ynhwikri/AwIO6sx
         TFiGndjoI8fTuoKdHM+H0FiQpshwg+XxXNZSBueOuvY5RHinRJfLkDnHHPY7ilFeX3KM
         6JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:user-agent:cc:references
         :in-reply-to:mime-version:content-transfer-encoding
         :content-disposition:message-id;
        bh=oSZhidXep9ZqP/yYb06ujCa4jLpPDdZ3fQEzb4ebxeA=;
        b=AX9ccLt7VPXYCYLkm7aOthHNs+WWe9Ac2WC2/gvckat3rLYtatxm5gBjwT3C/8iJhS
         IH4nq7Nvt7bk4kAIgx2gLjpbnXr4RYyXbaGjcc8Qs5R6xeUY5pJpBicDDt2giEMVOcKS
         1dEXkSrImYEziAQeMpXXYOuhVGCCfeTgSyPSbakTCnKQuSwjmSCT2v/R8EblBcWbIYEF
         EH3BvkoBGYE7P2w1kAT+AfsvySvKb6r1W5fpClWTNNVRYIjK61XaafppwOxDs6ZGcWj1
         R4f0Tia9rMPxJ6TOU2xYbcvki9qwfeHp7iJI5chqdhutrUsMFImoq5F2W2dwhum3JDhW
         NgHg==
X-Gm-Message-State: APjAAAUl4Oxjo+G/jj3kV77T+q/N8qBBFNLfVyn2mukZDBGHIwQ8G8a5
	+6Dawe7uuKYfsGE4wADCs83m6Me0UKI=
X-Google-Smtp-Source: APXvYqxQFRrcZh1MLOpMtz1rPunzFizLDpRKnWN2JRZAcxIb+5NFTUkWljdNJRAjJmOjH/8dulCTDg==
X-Received: by 2002:ac2:4ac5:: with SMTP id m5mr13592083lfp.95.1559576594831;
        Mon, 03 Jun 2019 08:43:14 -0700 (PDT)
Return-Path: <randrianasulu@gmail.com>
Received: from [192.168.1.121] ([176.116.252.109])
        by smtp.gmail.com with ESMTPSA id s5sm3202338lfe.43.2019.06.03.08.43.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 08:43:14 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: Alex =?utf-8?q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] cputlb: use uint64_t for interim values for unaligned load
Date: Mon, 3 Jun 2019 18:35:12 +0300
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,
 1830872@bugs.launchpad.net,
 Richard Henderson <rth@twiddle.net>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20190603150120.29255-1-alex.bennee@linaro.org>
In-Reply-To: <20190603150120.29255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201906031835.13420.randrianasulu@gmail.com>
X-TUID: XSNEqH2PRCOD

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
Monday 03 June 2019 18:01:20 Alex Benn=C3=A9e =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BB(=D0=B0):
> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
>=20
> Hopefully fixes #1830872
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index cdcc3771020..b796ab1cbea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, T=
CGMemOpIdx oi,
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >=3D TARGET_PAGE_SIZE)) {
>          target_ulong addr1, addr2;
> -        tcg_target_ulong r1, r2;
> +        uint64_t r1, r2;
>          unsigned shift;
>      do_unaligned_access:
>          addr1 =3D addr & ~(size - 1);

Unfortunatly, this doesn't fix 32-bit qemu-system-x86_64 .... so, my bug is=
 separate from #1830872 ?

I also was unable to convince qemu to use my kernel-only x86_64 gcc 6.5.0 c=
ross-compiler ..
probably x86-64 testing on i686 requires either docker (I don't have this
) or 'real' cross-compiler (build with glibc support).
