Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp178596lff;
        Mon, 9 Aug 2021 02:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg0rTh4898mXNaXLbDGE5+ZS5CQvR30Bss2Q3PoaKTmhnsAK61h2kACwXyxXc9QjQw3Sa9
X-Received: by 2002:a5d:8456:: with SMTP id w22mr156518ior.63.1628501902748;
        Mon, 09 Aug 2021 02:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628501902; cv=none;
        d=google.com; s=arc-20160816;
        b=GH9H/DdpTM0i/zll3gP1YcOejkw6R756zE687tNkEhLM/h+UvETdyqHTPOIoQejmnw
         MQPOxHDb5eYEHuS3Mz/lVyTT+tI4v6FB7Dgd3PTtUZMd6oqFKvHs5LG1Kt99DC7UYX5C
         6L6WigsZuk5dKZ/fruscmGhNFfwJWTAQ7jDj+kx5W2mVQ546QerLE9tTutyzpnsSO+Vd
         2BfBDJbtpvI9fV0j7+jYhKmhIP4eA6K9tCDL2BjoHOVTtB4ot7bL2cUdlSBLTebNpp+Z
         HKcoSsFpGiSixjvF1voJj0XR6GavrFmuRgHvfAneN/QxH2SHs9uFBy9NAZMv35yxSkDo
         hYZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=5xGtNtuXZebbmIJIrdRP6hJjNgGB3F3GO0W4SXqCAKY=;
        b=J7AQ9ivka1P+iFXdlieIv7H/ccYfgvR7puxJVYqV96ZrMVANOx+pE5M/HDsJ6hD/eR
         fr1xOypvMJUph7uGuduqzgdtfywJakbrfhyt0cEaHmZSZZNliGf1QCGAVBVQBYZUWhoU
         hXBd1L6JVDPuhfSZJWp0DJMvOfra3g6XpJN4wqSuwY5VnrCmUiUnxiqXOUawZhX9GXgi
         RbyZexPCJMJ+t0whaXzDzCJM/u8Toug3ZmNE3OlhxpVppBLtw8VWFSO0DK2RaslAvXFL
         SdHpjfjDm2TpFN5EvEKyZGZxpDh+FSXvN7KC5WbK2hHShGcOIS6httRkqw4X3MdiDxpA
         RzMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si17921084jao.24.2021.08.09.02.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1]:55866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD1ji-0005OF-10
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 05:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mD1jO-0005M4-1V; Mon, 09 Aug 2021 05:38:02 -0400
Received: from relay68.bu.edu ([128.197.228.73]:55308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mD1jM-0002oe-3x; Mon, 09 Aug 2021 05:38:01 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1799bLnL015881
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 9 Aug 2021 05:37:23 -0400
Date: Mon, 9 Aug 2021 05:37:20 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
Message-ID: <20210809093720.fslgjimjd5wa3j35@mozz.bu.edu>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
 <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31b39c41-17e9-3901-66c3-622afc653121@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B5ASn6THUVuI

On 210809 1131, Philippe Mathieu-Daudé wrote:
> On 8/6/21 4:42 PM, Alexander Bulekov wrote:
> > On 210804 1451, Qiang Liu wrote:
> >> xlnx_dp_read allows an out-of-bounds read at its default branch because
> >> of an improper index.
> >>
> >> According to
> >> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> >> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> >>
> >> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> >> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> >> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
> >>
> >> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> >> will write s->core_registers[0x3A4
> >>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> >> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> >> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> >> rather than 0x3A4.
> >>
> >> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
> >> but does not adjust the size of s->core_registers to avoid breaking
> >> migration.
> >>
> >> Fixes: 58ac482a66de ("introduce xlnx-dp")
> >> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > 
> > Acked-by: Alexander Bulekov <alxndr@bu.edu>
> > 
> > If there is somehow a regression, the test won't fail in a fatal way, so
> > maybe it makes sense to throw in a setenv(UBSAN_OPTIONS=halt_on_error=1)
> 
> Where? Main meson? qtests meson? setenv() in the test (but would
> override preset variable)?
> 

Probably in the test, with overwrite = 0 ? Without halt_on_error the
test will succeed even if the problem returns..
-Alex
