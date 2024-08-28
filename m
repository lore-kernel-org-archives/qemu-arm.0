Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp538555nji;
        Wed, 28 Aug 2024 08:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXb7P8qqlYzgMnnRLg6Ge2fAeEvYkrWHUom1/2dfIfyCyROTU3DEOPWZzWnVxmOQaL9tY8baQYWqrup5w==@linaro.org
X-Google-Smtp-Source: AGHT+IGPN+V/tnAvhsY7ulHDP5Oz2kTo7x86iHWU0K8JNT4EpInV+OQFbHrl441pNayVAEU/zTvy
X-Received: by 2002:a05:6870:c088:b0:25e:1659:5eec with SMTP id 586e51a60fabf-273e675e82bmr16917091fac.51.1724859478325;
        Wed, 28 Aug 2024 08:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724859478; cv=none;
        d=google.com; s=arc-20160816;
        b=oW6+48F50WlTH6ie1va0hVuvXoJ2xno9B9wDFQE+JpvOlutcxwMv80A2r/xTnPUkHK
         IrLNwrYBRdsg2McjnwfbsaNjmdYZ66ZaTxDy/Ps17IPygZ6eBsRQUnHEvggIRbn3erZF
         Ju5G0EHCAT5d74sIZfl/qSZeIoIKq/A+nu3UDlzAV8YBcEOzGhExD+PeifTYVQVx1lw3
         FsbCVtY5FjLKNyKLBewS69oHEFOd//T5w+YCqqgvnzKhxl1Ljn/H+b4utPAYjLb+g+DN
         mk6SxCOFleK10Sf1JuBEjy4J65nBbfxb1b8rLXXx6vzrf//pAHip4HhCRRp+x/QywF9/
         QElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :message-id:references:in-reply-to:subject:to:from:date:mime-version;
        bh=dO1fZTLNiGv+6CpAoS0q6YL6iEgt+5xlwWUJq1ZBEgA=;
        fh=kN8sVal+tR3t2lnKdIVwvFeVixNIHYD92P3X/aRob04=;
        b=hoc7cSiwb3/crykNt6ZnL42UOu8mclaEjIH4gV8A9eNP5LVNzsc0OBlfYJNvXNejUh
         EyPzFut4js/tNmrLLOtFC6UM2k5PjYg72i58ETbgS4GZnDpwIIny+ndQIeTob0Q50X9k
         VWGGvjcL9uGsvMBVdaqoIiYRDYp9Of6xYUMwCrkC8unbMkzeygsZBsc68yLOrYJ3BCS4
         dncCG+O4uOLud7qnfzIHCKaGpOnxfy4W0/MYBZNBGCQMG4nE//ofQt3TnsplAEcFYrT7
         GseubCEQbFAAUiwWQAPKx8Y/P0t3NNSTZ2ydpCiOVusCZW/1eLOqNpgkxElF9g4F3LPS
         qQ7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=QUARANTINE sp=NONE dis=NONE) header.from=sourceforge.net
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f328a80si1698218085a.129.2024.08.28.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2024 08:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=QUARANTINE sp=NONE dis=NONE) header.from=sourceforge.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1sjKje-0005T7-WE; Wed, 28 Aug 2024 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nerijus@users.sourceforge.net>)
 id 1sjKjd-0005Rm-DA
 for qemu-discuss@nongnu.org; Wed, 28 Aug 2024 11:37:25 -0400
Received: from storage.sat.lt ([213.159.44.44] helo=sat.lt)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nerijus@users.sourceforge.net>)
 id 1sjKjb-0006jm-1Z
 for qemu-discuss@nongnu.org; Wed, 28 Aug 2024 11:37:25 -0400
X-sati-MailScanner-From: nerijus@users.sourceforge.net
X-sati-MailScanner-SpamScore: ss
X-sati-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=2.794, required 5, BAYES_50 2.00, KAM_DMARC_STATUS 0.01,
 RDNS_NONE 0.79, SPF_HELO_NONE 0.00, T_SCC_BODY_TEXT_LINE -0.01)
X-sati-MailScanner: Found to be clean
X-sati-MailScanner-ID: 215241872E8152.AF480
X-sati-MailScanner-Information: Please contact the ISP for more information
Received: from nerijus.sat.lt (unknown [5.20.214.110])
 by sat.lt (Postfix) with ESMTP id 215241872E8152
 for <qemu-discuss@nongnu.org>; Wed, 28 Aug 2024 18:37:01 +0300 (EEST)
Received: (qmail 3711031 invoked from network); 28 Aug 2024 15:36:45 -0000
Received: from localhost (HELO n.sat.lt) (127.0.0.1)
 by localhost with SMTP; 28 Aug 2024 15:36:45 -0000
MIME-Version: 1.0
Date: Wed, 28 Aug 2024 18:36:45 +0300
From: =?UTF-8?Q?Nerijus_Bali=C5=ABnas?= <nerijus@users.sourceforge.net>
To: qemu-arm@nongnu.org, Qemu Discuss <qemu-discuss@nongnu.org>
Subject: Re: Kernel panic - not syncing: Unable to initialise architected
 timer : unable to boot Android 14 with qemu-system-aarch64 on Ubuntu 24.04 X64
 bit
In-Reply-To: <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
References: <CA+1FSiiUFeXRvyCk3KK7XfmUjLzOvBLo=VhcQDiZ1z8kgfpjyw@mail.gmail.com>
 <CAFEAcA8J18z8WubfzLu-DmTp6vGwcy4D652ib-KReqNS0whMVA@mail.gmail.com>
 <CA+1FSiir=RG1BTKF29BKxmO+GWDieyW6TxzWtdEX-CYu7a+z5g@mail.gmail.com>
 <CA+1FSij3LJc9S2ChBY-pHZ8QacFt2P0ygsr9LRK9FXLyMJrorQ@mail.gmail.com>
 <CA+1FSiikkAg=41EYfbfPe08uBHkP_FJ9Y2j6ocqChor_92TWig@mail.gmail.com>
 <CA+1FSijGTTt6YvRss9cDSOP5iOMCDmScpxP9ALJRJ19Vsjr6LA@mail.gmail.com>
 <CAFEAcA_zRSgFhs+kauEfkyzAYg2RwSBrkagDEoj5OCgm5j6=iQ@mail.gmail.com>
 <CA+1FSigzZxzdgTCWNRz3UGgTH5mRN8XTWWkeTU20N2ey4a+i+Q@mail.gmail.com>
 <CA+1FSigqsAx_s+-_eP0GtSi7Qq6Vcou12gHcGZwqPk1hhnXXwg@mail.gmail.com>
 <CA+1FSiiYm03SmjMaR0dLKye7j+LR4V-=u=nQu66=_aTrLVUpPg@mail.gmail.com>
 <CA+1FSigvsXe7eo17_qdKaY0Uo68u7Ep3UacooHZDNCnWJHD4+w@mail.gmail.com>
 <CA+1FSiiFFjp8O_D=PaGuZMj8oPYLdx5i-+Aq=S7=AZjZmb_aOw@mail.gmail.com>
 <CA+1FSih1Yv+-Cjj0rfnnV4CkLum4RESun2UiUoZm=Lfsa=PkhA@mail.gmail.com>
Message-ID: <9bc23ad64a9e5905d57fa85ca6a53541@users.sourceforge.net>
X-Sender: nerijus@users.sourceforge.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=213.159.44.44;
 envelope-from=nerijus@users.sourceforge.net; helo=sat.lt
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sxzkCHDYJJDh

2024-08-28 15:10, Mario Marietto wrote:
> Hello.
> 
> maybe I did some progress using these parameters :

> console:/ #
> 
> [    7.812969] init: Service 'recovery' (pid 106) received signal 11
> [    7.813381] init: Sending signal 9 to service 'recovery' (pid 106) 
> process group...

You go a shell prompt (#) so you can just press Enter ant type something, you 
should get result.

Regards,
Nerijus
