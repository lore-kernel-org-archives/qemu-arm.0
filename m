Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1849396ejy;
        Fri, 3 May 2024 05:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7FR1y3y8Wt1v3Bw8+JJyvJiJ4rDbRiEIWgNJujo52e17auDF2EGeDi0tagMR47ci3o6z+GdMIQmF7zrXmwCctY57PnYyD
X-Google-Smtp-Source: AGHT+IEZwwULEIWZKaTrsW3YKxGkL/pnkNYrmO2usaG5yO9avN85/g4MzBJo0IhfDWJdm2coWkDw
X-Received: by 2002:a05:622a:4c19:b0:43a:ca08:18e5 with SMTP id ey25-20020a05622a4c1900b0043aca0818e5mr7923248qtb.1.1714738555802;
        Fri, 03 May 2024 05:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714738555; cv=none;
        d=google.com; s=arc-20160816;
        b=Qq+eWkoqq4qM1is7JSoljkVR3zkndMz6PrLbJj0D1zYo+inU4aodyAdwyomLgJTIC9
         t/b1cIwONk2rY3+ebHbWPB+E+r2/dv1Wwbhxzc9PhvKLHCawDwD1wMDb4Nu1fu9/Gpj4
         nFHrTk1xK0Vo8Jh2lcpyPKmEHaCOVAEg7+eR1QqkSMZDF5z6W7DeRTg1dwkcTrIEfBST
         K2ctBCxLdMquTwlyUty/TcMxThokrrYLoEgSJJOUG4WOrSyRihghpVoPelElPTxqCWnZ
         B6POsiL1lMRwCpdUFUlbJPSpBv8wh9XO3zu77UaiFQzp/Kir4k3XTSygwlyuiKL0/Ozn
         Z+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=50yuEz0hGDCIwoiq3GTP9VO4htj2JLkjzp/bmPCAGW0=;
        fh=1JrFsirYkO9lc+lj9eHDF4B7AKfZAqav+lBpyjsdu4A=;
        b=K1XJ9cIMbYuiq6KbdbWod22gm20wdkO9MsADi7OETCJREY/2gODkvUOLvel5ViNibQ
         N4H92zRbWt/dEbFLWAoCXEgb00uKjvvybN2Opk4oqdfMVlCESpjbN6gY9HzRA8JBDNoP
         Nc2wSOeH22QpvomxX8hCAsM1ug9hYxo3I5yyj9NRM3ETqD6+gkAOWgCIwOTu4RBOAL8u
         b0iqWv3ZVRIRyBF/IL0Dv0zvGmcF/DWa+F8RIbdmnjNAgS8/F8jmCKStNgr/5e+QmCGy
         hGzD4SnUwc7FmMXAMiBx3a9I1Czf5M4Rfqef8O49UAYNISH5XQGV11UuwS66Zcw48haw
         Yg7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x92bio9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac8574a000000b0043c5cc59d50si3174226qtx.90.2024.05.03.05.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2024 05:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x92bio9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2roW-0000be-Bx; Fri, 03 May 2024 08:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2roV-0000bD-Mn
 for qemu-arm@nongnu.org; Fri, 03 May 2024 08:14:55 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2roH-0006jn-GN
 for qemu-arm@nongnu.org; Fri, 03 May 2024 08:14:55 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a58eb9a42d9so998680666b.0
 for <qemu-arm@nongnu.org>; Fri, 03 May 2024 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714738479; x=1715343279; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50yuEz0hGDCIwoiq3GTP9VO4htj2JLkjzp/bmPCAGW0=;
 b=x92bio9fjwjY1TfxZzKBLXVTA9jkCzP3SBbbRB+UFsBSGf84ArGxupLWQIeFP7D35P
 lW+gwcaiTVbyq7EkY3c/dwdC8oXenXtcb2IdVY4PQOeA+FjH8HVuyCgV6vwT7iEg3PmB
 YLBh9/T8O1JQCw5BqFw1G1To5oxPhZYMQj57PRk5B56fyN54+ApFy/Q9ca7mMyf3axTI
 3t1NnWWGU9DzKBOxBkuAqcxJFMiq0xb5Kp9tC/WTS0rl40D6c88GXQMj+Yy+THbxlJgo
 QFIotpZqLwcjrRW/s5GDQGKnDevB1uDNVM5iraUSmSrq+Rs6P3DhRO/hE0gMs7fN8Zmt
 HSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714738479; x=1715343279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=50yuEz0hGDCIwoiq3GTP9VO4htj2JLkjzp/bmPCAGW0=;
 b=ar6m3lXzKorhyKfj/hXVef3WL02JgJXUhlG8ye8OrHHnkD8Ec7sfYVMlNpEIyMuKXq
 cLAfeDXLfEgnPuWX/ps4oZyFxbz9nCFK+uUUeANrk+NvPcM1OtNv2NrPIAlG0dpYE5qT
 Qsefo8UKBR6EQQxPuOWASeUnvNPSJcGlFG0eZv2jFflEXXdPEz3I/nFi+BnqhiDM229F
 /S3y+F9cr7H8ce2T8FTle9Uz+kRUAPpoFFPMXSZ72o5SsuuEkCD8taUjWd3yc9PxDEVw
 9gjcR7FdTY8bgcbImL3lgdaSyTdyemsXlt/aKFLdcvUTy1vdKgjWA9b5EGEgovIlG60h
 ouBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk8MtGvzSaNDi2e95odtLY8peKXQUrM/qEGOq3pmwkTvkxe3BXvDneoc4EvpxNVibbOBFdkiTpbCfWyuT1jnpUMZ21
X-Gm-Message-State: AOJu0YzYZbQrngQPMJpK/2JxJrYZm13ExjY5XtME3lcf05OqSH7Ps6j1
 tge0rLgHPEnoNUPuPhen3KhOFgJp+N94bvX1Vc/e20zP2qAx5leumgJuL1JcrYwoLYNpYqTq1Ev
 mADYtNTKvfCAG/4xNCPvh1XTEY6jqMO1Q8JCUKw==
X-Received: by 2002:a50:d581:0:b0:572:71b2:e200 with SMTP id
 v1-20020a50d581000000b0057271b2e200mr1529037edi.22.1714738479509; Fri, 03 May
 2024 05:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240501182759.2934195-1-berrange@redhat.com>
In-Reply-To: <20240501182759.2934195-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2024 13:14:27 +0100
Message-ID: <CAFEAcA9LTsdjHpip1F=BPhrRUbH++3eW4HjjH4Xn6yN18pHtjQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] hw: define and enforce a standard lifecycle for
 versioned machines
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gMBTRIulYT65

On Wed, 1 May 2024 at 19:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> I wonder, however, whether we would benefit from changing how we
> update the VERSION file.
>
> eg instead of re-using the micro digit to indicate a dev or rc
> snapshot, represent those explicitly. eg "9.1.0-dev" and
> "9.1.0-rc1", "9.1.0-rc2", etc in VERSION.
>
> We don't use the full QEMU_VERSION in the code in all that many
> places. It appears in some help messages for command line tools,
> and in QMP query-version response, and in a few other misc places.
> At a glance it appears all of those places would easily handle a
> tagged version.
>
> For release candidates in particular I think it would be saner
> to show the user the actual version the release is about to become,
> rather than the previous release's version. This would make the
> reported version match the rc tarball naming too which would be
> nice.

I think the theory behind the VERSION file is that we want
to be able to express the version:
 * purely numerically
 * in a strictly ascending order

We expose the assumption of numeric versions in places like
QMP's query-version command, which reports it as a set of ints.

I think there's probably scope for making the "human friendly"
version string be surfaced instead of the strictly-numeric
one in more places, but I worry that breaking the "always
numeric and ascending" rule might have subtle breakage for
us or for downstream uses...

thanks
-- PMM
