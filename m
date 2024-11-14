Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp419447njc;
        Thu, 14 Nov 2024 07:44:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXUTDHg3717E/5yxfJDRcopwhAH2b3P8R13B/DhBXXRHVfwuaWEEHeZhpeG6dbZf7E3aapId4fDoddHoQ==@linaro.org
X-Received: by 2002:a2e:a992:0:b0:2fb:36df:3c8 with SMTP id 38308e7fff4ca-2ff426a3c96mr62350591fa.10.1731599093756;
        Thu, 14 Nov 2024 07:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731599093; cv=none;
        d=google.com; s=arc-20240605;
        b=XxKXCRQFLeakTy8YVdinYwJloXtv7fmIwBvDKfQcJJD8LQGygcVS0k0paFKzbdqniL
         MtwDd9ZCNCPADNCCa3K83wMTUq+gAaJ/X0V2NDTSYhdMxkFN3Ew1VZ53sDehfWm8d22b
         o8gyNh+RvMIiN/kWBpikDWm6qIAxCWWQWIQwdPq3VauAfkuQ+eDNJA3fP3mSXk5G1FJ+
         byjTX67oLoODyLhPa73+NxUateQlYJqGXkG83PLvqejFDLUOgOz4xRoeJPwk6vPbPHmi
         f5cwZ2NpE57unU2BctOlN+L4CO3JvTAFlQFKlFAnOnfT8NNIduzkc1+XZ99SEhJwJr2F
         k03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GkhNWkpl50ktEuRk+CafywAeOJJnevTAjIQ40ac28BU=;
        fh=EmoOuOFNCDv62+15anbgYAbgPTF4z3rxuvfyFUI00UA=;
        b=MhHkRw2yC9+hv7ssMa0AOHdHKzTwNWMXMWW3hRsyW/x83grmeSky2SUifMFIeuyBVG
         WiXVPGh/eV+7STwiTpiI6c5pAG7/uxUA+4lYgCMHhAXaaHu8wIMwJPksc9Uf9Qj7DrvK
         Z8u5Oj3J7NNFtZ9lSDzoi/HvIPakfTWEmPhyrEj+/Q3X6Ngmu2T5NmJMj2t2MphszGk/
         u90rbYZ/HlpjZtxg2my5TdxAMT1WL8XXiUY56ulmRV4lMa5bGTILEvoahfkIfdH3Wbms
         G+At/bpjIIMDpi8HXDbPOimHL1B5f9wuX13s+8q56y+r73CDkScRlwPddKdkRB4fK7uA
         qZLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4zg2qcX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ff59645d8dsor4087661fa.0.2024.11.14.07.44.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2024 07:44:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G4zg2qcX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731599093; x=1732203893; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GkhNWkpl50ktEuRk+CafywAeOJJnevTAjIQ40ac28BU=;
        b=G4zg2qcXeqH4WlCB6ut3TB2Q83GcIySoPBxWkX53WfBE9+RfrDTVLSLPpokinINcDi
         fC/mP1lZeoBamC8uFV3/DJ4rbWlvj1xoZRYKJVxQPs3XhX9ZiiWaFkIbTB0VMqjc8cGc
         so+0PNj7M5g3WgTaSb19XITU6xtI8QRAiBBBcMTfblvHdQ2NlYupqHDvNMhqQBvZa1HJ
         eNnP8/JpBPMiOF+mxHMLX4KcbXiWdhAS6TNRYsmmi/j7LeV38ji3mztkgsYPGVfHBdD5
         Ih22y99wl9HE7+SZp47kjC0i0ohmEqe2M+Ai192r1ciB0eewPPScuXswVhg+CgWSGRwE
         RMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731599093; x=1732203893;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkhNWkpl50ktEuRk+CafywAeOJJnevTAjIQ40ac28BU=;
        b=EugBANqKxxVp18fSG/Dl3NF0ZI/AH5NW/Zuomcm351p61+sHBWSkXqJ8DiMrljjccP
         j58mwIVE5rPQfkE4sIh1nrnSrSCHSNXuOWWXLXW7ubfwwcGkK9A1CVZsdIRIJ0SeMGwK
         rtMtQWCYDaQDh88/NZRoexYlrxjhUKe6sqfccgZCpRcTdMaVbkojUtjqAph3eN6GImC3
         nTI4G1PM/CEznUoM+WydsqO7pxO0NsE3OoTr9YCKcHxtGpTB73EgWiNM+v8qatQ9czgO
         F30hOTPKcQIn5zzVKaqVeCwTuNgKKuALNNI7ZM/FkHJejOstGAqrFOQP+d/AOWJhgV77
         xPxA==
X-Forwarded-Encrypted: i=1; AJvYcCXVd8jeAzqzb9dwsDhUZRSrJ6DcnzJeSnLQgODlpRmydw2tDPjMHjBlqxfYK0zhOFFR3vvybqMp1DUoAg==@linaro.org
X-Gm-Message-State: AOJu0YxIyzT5z2ZvX91IqozIch6vBHeGTPZaI1b/X0GWSuPiCsNSFStf
	YeVZbBPW/jFP3JbhlA6XSTzwf/AGRETeFzqu2NPV0tliq8WOZptjhu0mUAJzepbdRNXPNG15tZe
	sE/ymJvFsYx5BqW9PDlOJ9DyNzCaZQ/sh1MM1uhGQ
X-Google-Smtp-Source: AGHT+IGWg38u++Iun/youHmT7OXtuhqQzvkqvbeU3yLkWOtsRw903njcHqvRRNFmz/mD0O4qwB83QRZpX2F1leaRUbc=
X-Received: by 2002:a2e:a912:0:b0:2ff:191d:f077 with SMTP id
 38308e7fff4ca-2ff425b142amr64742961fa.0.1731599093108; Thu, 14 Nov 2024
 07:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com> <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com> <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com> <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_EGxj2aqc_2-kY@redhat.com> <63c232c2-a325-48d6-8ed4-753a7c6e3b4e@redhat.com>
 <87ikstn8sc.fsf@redhat.com>
In-Reply-To: <87ikstn8sc.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2024 15:44:42 +0000
Message-ID: <CAFEAcA_RGWq_ydkKCZGZ8Cn6g3_KSXu_K9bBC2u5g8=uBaJUUg@mail.gmail.com>
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger@redhat.com, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	kvmarm@lists.linux.dev, richard.henderson@linaro.org, alex.bennee@linaro.org, 
	maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, 
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
	philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: oE7aLGMohOvC

On Mon, 11 Nov 2024 at 14:29, Cornelia Huck <cohuck@redhat.com> wrote:
> That leaves some headscratchers (at least for me.) E.g. FEAT_UINJ, which
> is optional from v9.5, and mandatory from v9.6, but where I'm unsure how
> we'd discover it, especially as we do not have a way to discover the
> architecture extensions.

I think that's just an accidental omission from the FEAT_UINJ
documentation. There's a UINJ field in ID_AA64PFR2_EL1 which
tells you whether FEAT_UINJ is implemented:

https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/The-Armv9-6-architecture-extension

> I'm also not sure if I understand FEAT_CHK, which is listed as
> optional from v8.0 and mandatory from v9.4, but every aarch64 cpu is
> supposed to be compliant, because CHKFEAT might be a NOP (and this is
> only supposed to check for FEAT_GCS? Yes, I'm confused.)

CHKFEAT is there for cases where software (especially EL0 software)
might need a fast cross-OS-portable way to detect whether a feature
is present and enabled -- for instance if you want the compiler
to emit a function prologue sequence that includes "do XYZ if
GCS is on". CHKFEAT is in the hint area of the encoding space,
so for any CPU that pre-dates FEAT_CHK it will do nothing (which is
how "no features detectable with CHKFEAT are present" is indicated:
if you look at what CHKFEAT actually does it has a definition that
isn't how you'd naturally implement a feature-detect unless you
needed to make NOP mean no-features-present.)

Currently FEAT_GCS is the only feature where it has been deemed
necessary to provide this kind of is-it-enabled detection, but some
future features might also use the CHKFEAT mechanism.

If you're a piece of system software wanting to see if FEAT_GCS
is present you would use ID_AA64PFR1_EL1.GCS. (In particular, if
you're an OS then until you have enabled GCS for yourself via
GCSCR_EL1, CHKFEAT will tell you "not enabled", so you first need
to look at the ID register to see if the GCSCR_EL1 register is
there at all...)

thanks
-- PMM
