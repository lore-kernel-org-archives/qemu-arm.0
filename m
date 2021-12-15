Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp169395lfj;
        Wed, 15 Dec 2021 05:43:10 -0800 (PST)
X-Received: by 2002:adf:ec45:: with SMTP id w5mr4445567wrn.183.1639575790410;
        Wed, 15 Dec 2021 05:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639575790; cv=none;
        d=google.com; s=arc-20160816;
        b=DalG4H0ntUk96x4f6lA1zuZIFsJFrvrZ9ADevFNZSXDPC39naS0nQTOy9xbEha2eVB
         HNKJjjaHTkV1B96fLdHHM1sL6q882VKvZG/iv6danqKdgzgfcnUz6tzU53zaqoZrp38a
         Q2ogs9DuhuDKi3S6YnYbGmwS47NNGclXcSsqp6bbbEqH9tWD3+LeP+vdlLq4yvxSJc2M
         4HTCJmNlrX99Jz48ANJQdsA5CafK96RJ+l8LjUedymI+ZcvXk3Cujc8q1K7ME21Kbfku
         bLX3F9XgVSBja1nTuWVCPVRboDRtrhCyX/qygnbxtBnUn3M+txLd73PPKVdbwlJTP3mq
         d6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9nEdcr5p8OcHxve1Z5DC5oBdMvprAMYX5tTrlQkG1E8=;
        b=llCBmObtp6aQ9Wr2qyMBCDCpdbkJ++ogfMVxFgEoxj+x+ao7+TCPr7tiS7rezC9AcB
         9cdL4RDjsEq3aAgv8VsYRhV9l5Ug+CpZoxH2/zFxYFLDoYPnST3Wo8k/CRFsGZhT8VQ0
         9dtlihibkQrwNTQj1MEl6iIYrk81+5TRfCEuPleu9IjHLVk1I+jVE+bBfBpAO48dv8hd
         bom8lCH7+A6aLRsIW9htFgyA5sC3IDkPBMDSQjlJQsO4FxdiIbzsRamO8yi7U5QMzJJO
         q62VFaXgX3SD0gShykD5z5QGoYLW41OAV8rlKJ6gvLv9tEJtn9V8wCfIMqgeA8ZRUJbP
         U7kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5nsBURW;
       spf=pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=ilias.apalodimas@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ilias.apalodimas@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j18sor2827517wmq.29.2021.12.15.05.43.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Dec 2021 05:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k5nsBURW;
       spf=pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=ilias.apalodimas@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9nEdcr5p8OcHxve1Z5DC5oBdMvprAMYX5tTrlQkG1E8=;
        b=k5nsBURW0k2O5pBVlRPQYuFcXgIty+uBN5CKoxVY9lgwUjz1pmAHmHG9kDiVBiOvZq
         zRbX+OpqWz/VJeGw8S1lJtef/xvnmYxtJEGVyPhuUlnDW7m0UQ56HCqZlmlzKYviBnKv
         7hIjKHHiNIeNGvluYGdInwIG1W3lvqk4bvKaa/8qd7of19J9rpmbWLyAZXbazYkHRrn+
         Rrg9HSKejq7b5EcJIFVmdpEbvMhNPZqD6qzE9M/WjZomUEgz5oJkHgijUi+o5ZUEL7My
         CV3HCvE9lqrbhulLkL2qhyFOwQJCAQvO+YlyMXY7TL0nV+ww466cTHAX1OJnqwzIoJ8R
         Qu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9nEdcr5p8OcHxve1Z5DC5oBdMvprAMYX5tTrlQkG1E8=;
        b=BlxjkeUOt6fs6tphfOWTTkb1MxanbR+Q1NXnt/v77PREd7vzJBq94lEqFSlkF+ruPZ
         ZtCMYl8r5AIeoaS4a6T+WjyEGdMC6e0/QQrycn1VSJKo1jtBJiJPHxP7T/BVl71RFbdf
         Omg3u4dzj9idzqSiWhqKH4duHdjPCIOVVjfg2/mBkV/zIowcSFGtD5yy0uTp/AaFlRpm
         v3sBP5PhV5MCc5BIYDN8i38t/YSePqrBdVmltNjf+ZB2HAUEDem/OjDUrGoHJqeuo6Fb
         oSfA7DqCaNVeGAhGaaQyJBoxOtLrVTXNCssgFES93QIPspsJtRq81zpJ5JSZXUFzfYKY
         +ONg==
X-Gm-Message-State: AOAM533mwDQKrKhHkpkwa8l19blBTl8k045T8WLKTNSJ40u8GrgaHfVd
	RA7XNNK3hG9qD2VYLhM4Id7JcsAjbp4n2n0e
X-Google-Smtp-Source: ABdhPJzPyexGYnwdRdap/znx5OEHb+pRJO5tXSkPES0lYwvrRzNtXakaHDLsM1WCM4KRiy/cKOdhmw==
X-Received: by 2002:a05:600c:2304:: with SMTP id 4mr1896406wmo.71.1639575790169;
        Wed, 15 Dec 2021 05:43:10 -0800 (PST)
Return-Path: <ilias.apalodimas@linaro.org>
Received: from hades (athedsl-4461669.home.otenet.gr. [94.71.4.85])
        by smtp.gmail.com with ESMTPSA id w15sm2038057wrk.77.2021.12.15.05.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 05:43:09 -0800 (PST)
Date: Wed, 15 Dec 2021 15:43:07 +0200
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jerome Forissier <jerome@forissier.org>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
Message-ID: <Ybnw6+lOQPInzgqz@hades>
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
 <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_psjs5vaCZ06oU_OwSYorED4zgg+y-eD4nN5X2sRBVRg@mail.gmail.com>
X-TUID: PS/Y/i8OBGRq

Hi Peter

On Wed, Dec 15, 2021 at 01:36:07PM +0000, Peter Maydell wrote:
> On Wed, 15 Dec 2021 at 12:09, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > Generally a guest needs an external source of randomness to properly
> > enable things like address space randomisation. However in a trusted
> > boot environment where the firmware will cryptographically verify
> > components having random data in the DTB will cause verification to
> > fail. Add a control knob so we can prevent this being added to the
> > system DTB.
> 
> Given that the DTB is automatically generated for the virt board,
> firmware has no way to guarantee that it's the same every time
> anyway, surely ?

The firmware needs hardware assistance to do this. In order to have some 
guarantees on the loaded DTB, the firmware measures and extends the TPM PCRs.
In that case you'd expect the measurements to match across reboots assuming 
the command line hasn't been changed.  The kaslr-seed is obviously a deal
breaker for this. 

Thanks
/Ilias
