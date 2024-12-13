Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp482241njb;
        Fri, 13 Dec 2024 06:31:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7IdgcdM+8otkAEhMsp4FWgpViLk8jNQcYstduoDPN1jfBrpoYcVgpppPwLtohkGnTH3G9DGef0zXrpQ==@linaro.org
X-Received: by 2002:a05:600c:1c16:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-4362aa3e3a3mr29838635e9.10.1734100295025;
        Fri, 13 Dec 2024 06:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734100295; cv=none;
        d=google.com; s=arc-20240605;
        b=gVJ6AUYold9OQH+WsiPG4WGr2fPpj/QMAO7ZHqGX7c+61OW6U1X8vGm82ResBaCjOf
         tAV1DyTaxY2W5N6iVO8QoCYvPG25GwsiAZU54awf1szoprquWR7VyLpxKPqVK8btpPfb
         E34JoPMADh2hkWdTnhaqU90jPvsKXZU72LvyrGzmPA7k5rkafoldD/EJ8UKs+xvVlotQ
         M64ZR9b8ocCF83UmJSVdBJxaVIjlSWNaHSxX0bQYYic/Ox6mRWSjcBzjpREwGYEcpKds
         cGW0EJfsXGynq0uKEmu6wnQoYFAisg8dqwcCavpBo0/iE//pfpCpudjU56+E7I/nCSAA
         BBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=SOecfnNs8osThljsaAKU06/9OnPYwMOWV/4Rbge39/Y=;
        fh=QHQNnLHkvmK/6N7Ayi+Hta686I0NQ9kRjcDTvskzQ2w=;
        b=ld5Xr49vIev8XRxnt5axNz7wN73FSru/jGrVf+zYBqxE0w7bGA893NV1Ciubd6RC6Y
         ++fveymRzG18MPProv0pg3t0LBIVAc/7YWWLGVyVS3RPeJybm3j8heoW8e323bLFSFSa
         XmEDxB/kefUCnHIaIDy+CP7rm7+D1qhv6tiVihwnZk77fsVXVrB1Tts20tXZFHRP8SCP
         WITcELruOMd+LQZIB5LJYo951kmlMRE5DbCF7jvf9xUD1lWXujWiWzMjcTXoIh/rEllq
         MnK4/fzVZ2RGVFPESqZDcBFD4jp8drOBEL+9lqepueNd+cR6TX4lPvCueQKsaSa0sX1a
         wOtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDzOLeIB;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3862276144csor4560953f8f.6.2024.12.13.06.31.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Dec 2024 06:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XDzOLeIB;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734100294; x=1734705094; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SOecfnNs8osThljsaAKU06/9OnPYwMOWV/4Rbge39/Y=;
        b=XDzOLeIBxwWSTyXpXilyQQu7wdfvBLAo8b1o51V4sA9l6MOSlvq6thwOCCy9TTXFQx
         VeJ504UUxX6GXWxSFfXV/AdpT8Tn1Flm2ldA72YBPsJLTh2jEWVcccLqgIwPY4t28Ev4
         mWFCad5H656ikunB8OFvzP7A75I1eushBwjb7EgB8MMxpSz4uteLeuaN8dPek9P+bo0X
         0T+ZcjZhIbDQMB1cqEuek0vYBOH3tStPX8l/QYdDdo+p9x0+x9dELAputOtKZjeXLwvv
         JeNnwsAyXn+0yGPi7WHaMvee73nlYiB+2rFfd0iB34qnkqhkrXNkwZZ/LSWuSincqIjK
         4JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100294; x=1734705094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOecfnNs8osThljsaAKU06/9OnPYwMOWV/4Rbge39/Y=;
        b=JTOYBQ+CHbjKt93TJQyRwkQpMvq5cN0yEhZX9DseJ/Omz1iHvhbIHXIlzumCG1yTq+
         GNNrO6ohkdKiWggdFQUBc1+mvbaufo7kINhhsRi4YMp4TpmxfKr0LxNUFACGRZ4CRtQA
         HK+hQcsXLE37+zKHLI2fP1bWOH6tOptbb23so5YFp32q96ajQMOxBiSpntvMwV1JY1TE
         Zpvl9i2eR1Hsr1zWqESJ740MHMg0MrBM0qJat7EMtBqSrfyskl7JAi/2fV1xFa5ZiLDL
         fsMJlaRzk4cSTKaSFEi9AsaueE6IRNr85ZxR4yMJ8ucyOH1CYEWxXthsrQ6Bm8aF09ze
         fkkA==
X-Forwarded-Encrypted: i=1; AJvYcCXBqt6Ue14h1efWkFCvSOts/nq5aTFmsgJBnPcrg5XrYThAmQJAnrG2wDawrGfQAztvRntEtQqj71F2Ig==@linaro.org
X-Gm-Message-State: AOJu0Yw5ugvubiF7I527x535iaNASwRInIm8qKvVuNDIsemVBJjfAKRO
	+Pu5nBhZa+WqEhmWq6gOVBbbFHjzkV96KOgfdEUppVu0z5M7dFbeex58FOl+LeuIQg==
X-Gm-Gg: ASbGncvV7aGEa6V1kM+Xw1sNzV0Ke+/22CU9vl34LAm9BYRk2oOHAwbWTlkA3ZGs2Vn
	CpqBb+8wHRTZ/Qxt40iEl1XprfhYNHQcGciXIXDGnKgUg8nReuSq7u9xF1e6Pz6n2h5Ni6hbeWF
	BXwgy72gV/4k0CpH3TV3oPDSY6eXvsLP4T52FFpMeM3o1WyXJlx5FVKkd4OZG2QYGrPwtpYtylz
	HrxZvxaSWb1uAlixJTLvi52DOOKOSKFvRfP+SnwCyOQvQo+Wr1ZMeo=
X-Google-Smtp-Source: AGHT+IG2cHyWZGrtAijYHh0GaSeRIjMYA9G08jmCcjF2sx0R2CtD4J1Job5e8KaQZ8XAYh7s93jKdg==
X-Received: by 2002:a05:6000:1fae:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38880ad88dcmr2171599f8f.16.1734100294465;
        Fri, 13 Dec 2024 06:31:34 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514c06sm7357538f8f.73.2024.12.13.06.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:31:34 -0800 (PST)
Date: Fri, 13 Dec 2024 14:31:58 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 23/26] hw/tpm: Add TPM event log
Message-ID: <20241213143158.GD2962236@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-25-jean-philippe@linaro.org>
 <1da8840e-a7be-48c5-bc06-e7a4e111b9e7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1da8840e-a7be-48c5-bc06-e7a4e111b9e7@linux.ibm.com>
X-TUID: iiHz+Dn2C55n

On Mon, Dec 09, 2024 at 05:34:13PM -0500, Stefan Berger wrote:
> 
> 
> On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
> > Provide a library allowing the VMM to create an event log that describes
> > what is loaded into memory. During remote attestation in confidential
> > computing this helps an independent verifier reconstruct the initial
> > measurements of a VM, which contain the initial state of memory and
> > CPUs.
> > 
> > We provide some definitions and structures described by the Trusted
> > Computing Group (TCG) in "TCG PC Client Platform Firmware Profile
> > Specification" Level 00 Version 1.06 Revision 52 [1]. This is the same
> > format used by UEFI, and UEFI could reuse this log after finding it in
> 
> as used by
> 
> > DT or ACPI tables, but can also copy its content into a new one.
> 
> I thought it was going to be a completely independent log. If UEFI would do
> anything with it, I think it would have to replay the measurements into its
> own log and extend them into all PCRs of all active PCR banks of the TPM,

UEFI does need an event log, because it will measure some images using the
RMM's Realm Extensible Measurement (REM) registers, but nothing forces us
to use the same log. To reuse the existing measurement infrastructure
those REM registers can be mapped to the PCR numbers already used by
UEFI's TPM support, like Intel did for TDX:

https://uefi.org/specs/UEFI/2.10/38_Confidential_Computing.html#intel-trust-domain-extension

So for Arm the RIM could map to PCR[0], and the four REMs could map to
PCR[1,7], PCR[2-6] etc.

> but if I understand correctly then you do not use the TPM for this log at
> all since you have a signature over it and defined (somewhere -- where?)
> that only sha256 and sha512 are to be used for this log.

The algorithm choice matches that of RMM, which only support sha256 and
sha512 at the moment. But it's arbitrary. We could use any TCG algorithm
for the log digests.

Thanks,
Jean
