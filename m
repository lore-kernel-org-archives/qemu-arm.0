Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2316552wru;
        Thu, 4 Jul 2019 12:12:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxt13f1J1MDlaV8f9/Hux4b3qWxjtUOSt7pRIY8fXNPblEOHuUQMnAltYGiBBxfWhGjVTsd
X-Received: by 2002:a17:906:b216:: with SMTP id p22mr41936124ejz.273.1562267572293;
        Thu, 04 Jul 2019 12:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562267572; cv=none;
        d=google.com; s=arc-20160816;
        b=G8+c8RQOs29nAqLs6opjeEtcF/XZ+2+CbNNTVWpQRcJJQAsr/2/iGYXWpo0A6Bqu4V
         WmOQOJalzGioEzWQIedFvuw2O1hgfLMP27c+IrJHNFld/bMED3rRPYGTohBbcVK84FhC
         6uR9yU6ssfsCjmm+SmmIrZ/aw+7CsCyVSmlsehupjSOsUJH1Pk+BGs/KnwFrxZmxwawb
         26QUSQ+R9r6rX8YBxhBe4AGt3dWgMRsHX9BrnsKmbvtVLNshSd3fcSXpyGUXPaBHuP1/
         NIbtnyoH4ZqUlQYjujplvsA8/J99crvE/+Pfd/eluIMRcI7LBYVKsLA6FGzqnaSRyY/d
         hdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=MYLsK+KgpWko9IY90dDqVXRWtw25c37fNovrwPJIMhE=;
        b=MSDMITOo67NJmdQm7RY+vrlcoujwkvCW2HgbeSJ391Z6Yth4MFwl+XCvHJE3ZCHjHG
         qt9cievn+DbrqnQwacG0RF9YW0sC8O+6d7/1/K7qMciH8pEyKkWa1EPTkJ9Lxln99quA
         9gd+nRvdfnbVTU8FNiYv/gBqSkp2kEoHkcEAZC7AREGNmP3MQoPTqBxuy57E3yV62Hvb
         J7J+nr5ag0QFXOTb4vueITBNncKT5pd6xW3SkUTuevZnlQ0krlJTsYi7xo4OT6RgiujF
         LkDG35w92xxW7lXOab8kNab/k5PGV6EhNmKebWdQoe54W7uLaIxYtGo+ketvWGKP5G9K
         vd1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlRwQwqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si4093299ejp.398.2019.07.04.12.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 12:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlRwQwqa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hj7A3-000789-D3
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 15:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hj79v-00075y-Id
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 15:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hj79u-0004EJ-I5
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 15:12:43 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36343)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hj79s-0004C6-08; Thu, 04 Jul 2019 15:12:40 -0400
Received: by mail-lj1-x243.google.com with SMTP id i21so7051395ljj.3;
 Thu, 04 Jul 2019 12:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MYLsK+KgpWko9IY90dDqVXRWtw25c37fNovrwPJIMhE=;
 b=VlRwQwqaog5CTdT+rrqF4Hnt5s/6HTrbRvfM6lGXvB3t3a5mD8nSBj8JwmEkoOey+w
 7s4fg8G3vEKCENOpFrjxzCYkiDkNx0kis7zdCbgZos+nl0R+J14HyvCaOdwp264TUQhs
 Hv3T+upZxm4ldcMhnhGDfYzPsj+FAlr7ntux7a4uqt59XtcoD21m9V0/86IzFs95WVVA
 JyWDF28fwV2slg5tAWiF3Gd3ANC8IJmVOkiBt0tLF/LnCG8zxPjOVXwsJlRyoioRYNRZ
 T0JIH8v4e3FLn0Ft+g/zTbObu63/Y+TPsQFQyinvloQ/rf3RYGPNEbe72G1J6mxJAPUI
 AV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MYLsK+KgpWko9IY90dDqVXRWtw25c37fNovrwPJIMhE=;
 b=fVLj4n4AILHJvSIQ7jd+dJ4aNor+DBZyaIHjZJyFj1YBM2UkZwUp70wUQFzQcMn6Lc
 CcLIHyfdxIW1Yhq9n+9JjjM3Qn/YSSr5J23E1f+TybR7XPAJzmOXivXCmXNjsvGic7Ct
 EYteUPYmC7OC5EvTxH3au0Rj0FQWW1tomg3vAc9pmxX/wk9f8FhPDSVZbbbKFFafbatY
 FW98rDgQWoA8XDuYqgdQzxjfk7a0Nmppbskb8Qt5rLGE7baRA9+U/c4ZloSCx9Q0tUye
 CcD3JsW8m+pC+D2ZEZv+ZalqMz24ZeU/h6ph21uudrCsmjRALsYp10ewVmxjZP7/LVh2
 t8Ng==
X-Gm-Message-State: APjAAAU+COcB2FXRIrsCgL7fZf3lgOff3Zv+ItAfg+ISFWrVKZheAvL9
 DP16oTfXArd7PekVpeFVCdY=
X-Received: by 2002:a2e:5b0f:: with SMTP id p15mr25104340ljb.82.1562267557826; 
 Thu, 04 Jul 2019 12:12:37 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 e26sm1294711ljl.33.2019.07.04.12.12.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Jul 2019 12:12:37 -0700 (PDT)
Date: Thu, 4 Jul 2019 21:12:35 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190704191234.72ozyrtwdnc7r35a@fralle-msi>
References: <20190703190615.31436-1-ppandit@redhat.com>
 <59f87427-3d1d-928b-ac87-0a0a4049c4f5@redhat.com>
 <CAFEAcA86=RDpZEzWF_5QL_ix8Bghqxvn7ykXUBkAzTWp7KUVcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA86=RDpZEzWF_5QL_ix8Bghqxvn7ykXUBkAzTWp7KUVcw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add
 lqspi_write routine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 Alistair Francis <alistair@alistair23.me>,
 Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uz0nJXsmthk2

Hi,

On [2019 Jul 04] Thu 11:42:54, Peter Maydell wrote:
> On Thu, 4 Jul 2019 at 11:11, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > However, looking at the datasheet 'UG1085 (v1.0) November 24, 2015',
> > Chapter 22: Quad-SPI Controller, I understand this region is only
> > accessible by the CPU in READ mode, as an AXI slave.

'Chapter 24: Quad-SPI controllers' in a newer UG1085 [1] says that
writes are ignored and that "All AXI writes generate an external AXI slave
error (SLVERR) on the write response channel" (when speaking of writes to
the linear address memory region). Philip's solution seems correct to me
with the minor change to return MEMTX_ERROR.

Best regards,
Francisco

[1] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf)

> >
> > So, if we model this, even logging LOG_GUEST_ERROR is incorrect, we
> > should trap some AXI bus access error.
> 
> Well, that depends on what the decode and the device really do --
> often datasheets are pretty sloppy and just describe what
> software "should" do, not what the h/w does if software does
> odd things...
> 
> thanks
> -- PMM
