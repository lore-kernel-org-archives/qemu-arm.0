Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp230176ejx;
        Wed, 9 Nov 2022 04:55:22 -0800 (PST)
X-Received: by 2002:a05:600c:2c50:b0:3cf:4d12:1b4b with SMTP id r16-20020a05600c2c5000b003cf4d121b4bmr873249wmg.23.1667998522805;
        Wed, 09 Nov 2022 04:55:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667998522; cv=none;
        d=google.com; s=arc-20160816;
        b=GCQX+kiu+WojaEEaiBxmBbxtaQoADUk+5tb84wgGzoUqwcJl/Mo5MHPycBNRTc1SX2
         OTKqm3xtN3TGHseWu/Jmm86OFpFIOY2MWt+lC40LveEml8uwPY6CIo0vSh+o2rXtED+q
         F0kmIMfAVdHodmcetUsP5PwMB8jU8HZTIB9i3TWqN9Hx8akSIStaOoKrP2k/5Y5YZnu/
         zVUmvPRdI7JTsOcvdj6vCdHE4DOPBuruKeJTTGat9ZCgvrCjlxUqjLaAnWIOZYIM14Lc
         ofDHscSda2OXDBRtOcpJtb6UpDjmXMChgKsgLu1omL28Misd/WpqhtG4amwczvaWdpA+
         U1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w+C/UX+wZCLgCzDRjAbBH13JpR4bUNUDvsVDBUP8rfw=;
        b=JVrMcCgNWxIybqvYMVJxhPv3C1hZFWApjw+pznUthQoRUhagu5PnAiHpZd2OW4oa8n
         kL+uinozs/TmsyaZcq8+qjBv7LqdIq1BNbUpRQ/gzaOLN52wV6lT26RwJo4xKplItzKe
         9QJatS5rkXB3YU/ENh1wI1z2aL5J3wzbrfTrX1kH+maimacTGCh5qqY9bTkWL3F5UuBt
         x2stK/Y98X1QXG6b05eatMu0NcwIBjvDvJske1WE/cxpyPjLXM6wM705xRWv6Hl6zUEO
         WZ/xl9fHVKk2kV4Ioj1HHumuOo/6LlOKohlHWD7PUy8Vlwi2aFHSxTkZjSUajBiPViGV
         kr/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ekzeRN4Y;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u18-20020adfb212000000b0023622d65cb9sor6112284wra.71.2022.11.09.04.55.22
        (Google Transport Security);
        Wed, 09 Nov 2022 04:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ekzeRN4Y;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+C/UX+wZCLgCzDRjAbBH13JpR4bUNUDvsVDBUP8rfw=;
        b=ekzeRN4Yw0mpLr9VeGW9jsXuFTf4JuRTP4NjZpnUlGWtMfB89dBpC9/78e1wM1gKRF
         zt8hxeLr8p1AbieHXfm4/w80mFQdTGFT9gd9jtbvmIRQLDT7uPcoK02e0AjEq7zBSOTb
         PXz+UOLPGhDleBrtBghrndRKbalrreuLiM9er/vM7FBKa614XcY0UUq7xlnjguVqchh7
         PEUJK8de3APAmvUD45cvMiRUEJk/C7ZfhQJ4J9PNloX7N8HeKlpwGph2j1kA9yHSCm13
         lc62XuW5dZGbMiTHuLbRlnSxWZwvCQ/lylr7CFoWY6Dk+odfNylivcwP8H26rxAEsAcM
         8tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+C/UX+wZCLgCzDRjAbBH13JpR4bUNUDvsVDBUP8rfw=;
        b=Yk/+bL2Khtznh0e+csIKcMsIg/cVnPlSo1jarqswKc/Z8w2uksTLKOB5j0THGFlVXW
         iZZCws72OEBTNKncBg0VsqIxAPVXu/UYxFP0CkNSuvrkpRZeQSIOriteKPSmLZhMLm2u
         zknIm9nDicrjzZDZdXhtvHH1/LfBR5NQzRD5wScHpkh70FU3ApsgcBBShIcv6BKJSTL3
         hTwBXDfsI/z74Bih7O+4JwzVcd/LcH66Y/LC2Bivdw1ph4g+ZmmdQx8EpJ4VjS2vNnaN
         weWEFOHSFTXpIN/mrXjGM14xyv2fI1SjKGfVJ3LPZ2FtGMMx0eyDTdkAgncARCe3fTwY
         gy3A==
X-Gm-Message-State: ACrzQf2wMdsAJG2UPe1QrULMiGBKgCDlJfgtgzv6ypxiL6SsT5n7M72m
	rD3vo3n3izTnG+iXMimJ04Sa0k2bk0fv6AWAni6Ok2UTP9ZdPg==
X-Google-Smtp-Source: AMsMyM5fh/48mKuX1BMDQvRee5D8c4ORDhOfBMmanJg2THebR5eH1q0L32DwhL4zRCZwffbC3fYja6FVzsaww16G5fY=
X-Received: by 2002:adf:ea10:0:b0:236:ec3e:869d with SMTP id
 q16-20020adfea10000000b00236ec3e869dmr27374695wrm.33.1667998522373; Wed, 09
 Nov 2022 04:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com> <20221104184101.6923-2-fcagnin@quarkslab.com>
 <87a652hmoe.fsf@linaro.org> <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
In-Reply-To: <0a146956-a397-54c1-71dd-cd90a68218f7@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Wed, 9 Nov 2022 13:55:11 +0100
Message-ID: <CAF8_6Kk9CWdveyYPRHdN1wXN+9+Mp8fZ6=yDtkvrR_7UO+Y07A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm: move KVM breakpoints helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com, 
	peter.maydell@linaro.org, agraf@csgraf.de, pbonzini@redhat.com, 
	Francesco Cagnin <fcagnin@quarkslab.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8SwzMCv0iJ0y

> I was planning to move hypervisor-specific code to target/arm/$hypervisor/, but here Francesco wants to re-use the same code
> between 2 hypervisors... Maybe move it to target/arm/hyp_gdbstub.c
> and let meson add it conditionally?

Something like this?

-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'),
if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c',
'kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
