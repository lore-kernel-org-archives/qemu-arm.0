Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp38418ejv;
        Tue, 26 Mar 2024 12:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm8byrlQoxuU1IhdAFREiPDtDe/LBkwvbvAmuNTWGrL7Xo9bh90+TdWSltDG0Kz1Lbc+Rf1ZZ6G05d7oUq4LqH8kPxxtHl
X-Google-Smtp-Source: AGHT+IF6761GdgU4ytnTOLKKU+PDCzCT6UNcUs18vVBWar2Uy4BTY7P6JH3LbHeGmw58sy1aL+/Y
X-Received: by 2002:a05:6808:6412:b0:3c3:7c71:9ecc with SMTP id fg18-20020a056808641200b003c37c719eccmr2508789oib.7.1711482419940;
        Tue, 26 Mar 2024 12:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711482419; cv=none;
        d=google.com; s=arc-20160816;
        b=c5CaMk/phngeKKRbRvrJS8Mxr4nAl+gHPw38q+rTwo5jXd9Rql0P9bpeVLl25B98HC
         PidVwMpyDLVaeYLHt9xM10PU4TVQ3xnM2EZ4tl1PPFePxfXF1qJmwRFVgHXCg7oqnoEo
         jSHs94/TTqnMBwhfUcFEeq3e0NtyC6R21Sbl8WHsuoCAMM8Z8LFXcwOylvGM6pB4Bzgc
         gkCj8v570igW1zTzjylk8QgygT29HdepKfdvvKb5+mMwlCRl4gNSLvFUwF7pWCfcni5M
         Q76ePNelJUygF/J8/R6CW0o3nwaGrAbKislwtzsFAp1nxttlzwLCjkA8AREZtauV14gf
         NUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BDD3WfJY/9HlHMBatu6zAc9jZ/h4veUfHEkl21PnCXI=;
        fh=wAiunEeDhpzRUTsZ+16+NIZwE+IpknyS6u6c833hP7U=;
        b=OKi1DFhSrGhDm9r0211jHOcW6IwqAuC4jr6AummLuSCkWPwfQXZIxdz1iWZY0dfDDY
         3eZE2mwG+Gt49BnHW6KpkCe9Ai8J2b0ILR1+wE3+8JS5uvk9YgxChymwTpQq795YdmaD
         5g+dMCGIywFO7yTnUHbbCq+e5tfVXoy7I7DpF7/wY4xZcJExY0N3svcxhFoI7JkxTP7c
         ocxz6yT2z00XhdzHTvJ5JYuViLBZsz/F+gxNXn4+LEa4Y+3mq2dNSVxAEdc2Os4LKpUy
         7wgUk9v7ccmbUOuORI+aoVQoQSy2bQHZTCMGnSeND3/brAj0+7PPPXGauaUIvYe3uYgk
         eqdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hn3WTQt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj8-20020a05620a1d8800b007886cc4988esi8064276qkn.161.2024.03.26.12.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 12:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hn3WTQt0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpCkt-0006YF-HW; Tue, 26 Mar 2024 15:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpCks-0006XX-Pz
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:46:42 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpCkp-0000e2-Ni
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 15:46:42 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d68651e253so95923351fa.0
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711482398; x=1712087198; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDD3WfJY/9HlHMBatu6zAc9jZ/h4veUfHEkl21PnCXI=;
 b=Hn3WTQt01jbQF0A/ZI1/tEEacy0ePSVhKaib1a1LVkrRBRbK6B2cG92PIruLf1ucLZ
 mJ36QwCJ8rsUGn1DR5+TX/cClTtAfj22BPC4qekKTPSnfj3koOyzjZqzK7Gp/tltZ8r0
 uZJjmaT9Vu1at0MNy3Lx6SZt6dyHao02AQOMgQzt/fpX8t1DBs8VpeGrTlDC7NQzUs9h
 AoaO87Kf/Y1iUWTi6SMr5jUaCy/FpmOdjOJAd2xmcochGwFBY4FGHhquPQosrLip5k5M
 dI0dLhLgijc8+2lBscl+tnwPj4zawKuWnoI/vHjGO3sFv5pN2mO+XDI1tCbeyhav7jtH
 OURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711482398; x=1712087198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDD3WfJY/9HlHMBatu6zAc9jZ/h4veUfHEkl21PnCXI=;
 b=P7AL151I2VfvkRg7tnF1ATi677PGvssaJE9motHdKusMRPGM37bd8JdHk7yren6O8/
 3MVOj7UbADVqx6MiIc7DfWKTsXm1ya12k0MZc4fEGoO05A/u+t5l3BIzr7p3xwWoFI5A
 2I1aQc3jzhSQjBy7+Gr0OScq5dytIKl9TF+D8dYsidRB9II3S1wjyH18SxG10aa//9W+
 8Q4KPQ4DEZj68vah2+94vURwVSaOXkuai7lzZcnBKZhoXrH8dA/CoEfUDzOijBugpiaI
 33b+qGZE/5Sq5j7Txws5sLY612ZdFITn24RExTaQsnUpSVkWRnpuN7+CVW3ANPpSWOhi
 ku/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUarjlyaiTgV5EwGEAx1jP2O8uj44WBZ3QxOD4CUnMmk1gzhKMgZSwk7WTONxys6EsPPArR6HMMh0UknFpF4gCLYt++
X-Gm-Message-State: AOJu0YwXbobdzwdkKD3Q5O/hfCva3rmTrwveVbfTmda3AGNWQeM4bt7h
 T49CVymk4lzWdhQ6TERqdvmHODVarW9rTSPG3L0+so3EdGJcSWAk9rh+IBl6lSwIFvfEeYPOlmb
 AVyfHbAWEeMW0RNa+xb17knx1Cc53OwWaZKDNpw==
X-Received: by 2002:a2e:9044:0:b0:2d4:4b13:3413 with SMTP id
 n4-20020a2e9044000000b002d44b133413mr460680ljg.22.1711482397783; Tue, 26 Mar
 2024 12:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240326154505.8300-1-philmd@linaro.org>
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Mar 2024 19:46:27 +0000
Message-ID: <CAFEAcA_uKn1gBmDnq5o4c_Ht1qA8tAarzBSNs-fCao0QvZYtow@mail.gmail.com>
Subject: Re: [PULL 00/13] Misc HW patches for 2024-03-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RDWXZiHiHI3a

On Tue, 26 Mar 2024 at 15:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The following changes since commit 096ae430a7b5a704af4cd94dca7200d6cb0699=
91:
>
>   Merge tag 'pull-qapi-2024-03-26' of https://repo.or.cz/qemu/armbru into=
 staging (2024-03-26 09:50:21 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/hw-misc-20240326
>
> for you to fetch changes up to ccebb9ae352eea63cb1491cb829e4cd0f7576f1c:
>
>   ui/cocoa: Use NSTrackingInVisibleRect (2024-03-26 14:32:54 +0100)
>
> A pair of "WARNING: line over 80 characters" are ignored (82 chars).
>
> ----------------------------------------------------------------
> Misc HW patch queue
>
> [hw]
> - Do not silently overwrite 'io_timeout' property in scsi-generic (Lorenz=
)
> - Propagate period when enabling a clock in stm32l4x5 mux (Arnaud, Phil)
> - Add missing smbios_get_table_legacy() stub (Igor)
> - Append a space in gpa2hva() HMP error message (Yao)
> - Fix compiler warning in 'execlog' plugin (Yao)
>
> [target]
> - i386: Enable page walking from MMIO memory (Gregory, Jonathan)
> - tricore: Use correct string format in cpu_tlb_fill (Phil)
>
> [docs]
> - Fix formatting in amigang.rst (Zoltan)
>
> [ui]
> - Fix cocoa regression in platform fullscreen toggling (Akihiko)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM
