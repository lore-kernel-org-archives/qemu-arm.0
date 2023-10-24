Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1980104ejb;
        Tue, 24 Oct 2023 04:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB2l+OFPhDvL673VtxBmD+UbiWL83PJsZRPLF39H5X93C7JVhgvs8VuAggqJr4N6dtwpBY
X-Received: by 2002:ac8:4e81:0:b0:411:5528:64f6 with SMTP id 1-20020ac84e81000000b00411552864f6mr14277897qtp.27.1698147274353;
        Tue, 24 Oct 2023 04:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698147274; cv=none;
        d=google.com; s=arc-20160816;
        b=JMPjLWtvq6hm+d/U5DF69SEsoTQvYyg6oeXShk/h+i2jtSlwO2+gbrdCVih9EdysCC
         bD68xBZU0wt801W6x/Ipq8yOku6TeA2FtkIliG5jMOAJNPUcS+ab9uIBa+JRoBDreYOC
         GJo3QVhgVuMalh+5M61kNP2v2CxJG0sgFmplZe0iGaykuwfGLb/WYlTmWh0qvtjPpsX8
         0PgzdTCeLSJ7EwJvlDSdb7+8WYUQRz8Llf/NFSHP1zIJHhrHgI2sCULyGgGoPSCZxDbK
         2DJnvccAxolTd2ffIOQlLIBZNyupBy/biQYwVVeETUD5a2iC2xOCnRyYZsmRBfWAaOhn
         JjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=SDdDuTaN4SoAWEpM2HKbvwWC/AnVWG6bKPnln/BNFPM=;
        fh=C8p6wC/fCaHRHIfgiJjtLgYEof4GUxz85Lbf9UGgIR8=;
        b=ylZggzvn7RvV+mzhXmkIcjwi3uRJ2xj4t38BYxeSKWIgtF8M89e2wqQlmn+Pkf8Y5u
         Qe5t2LeAE9zzaW65LZ5NZPoGNKKGMLc5GtY/3HP8nA1gUF9EAJZ8DNOrBObMlTX1uqJW
         nNU3kodRjrxlPRXaBpJl8HrFA3iBssvvNlQNLwyUBe3v6MkbfaXdVbP1vukvsG4Yns/b
         fsTy63Q7LDg4kF+wv02x4Pq1pou8B6SquCGUJ35QOnRDNd3wMqy7FVpdf595LRGnFSf/
         TAa9aE0SkN51wIUWJuT4n3tJJUGrewa1gOA7TlmBi4IxW+98vaRIf7SEQKRLXmYxbG8t
         2CBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Nbu7HyH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020a05622a170e00b0041b77382a1fsi6840365qtk.598.2023.10.24.04.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 04:34:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Nbu7HyH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvFfr-0002Iw-Ci; Tue, 24 Oct 2023 07:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qvFff-0002Fh-05; Tue, 24 Oct 2023 07:34:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qvFfb-0003XM-SE; Tue, 24 Oct 2023 07:34:02 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OBFruY030894; Tue, 24 Oct 2023 11:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=SDdDuTaN4SoAWEpM2HKbvwWC/AnVWG6bKPnln/BNFPM=;
 b=Nbu7HyH4d39Kp0iB+z//t5OAGEFCvePvI+VCVMlCc+A7pp3g8W6L2lEyt7AwENfe6nHN
 BrYi2YgU5WbLlrm6dE8GwNVxLUxPgxkTC7gWf3vqjhSe210N6jeS+HZjP5aN9yKaMW+0
 gE7Els2Ns4ZmsjMkSSrnufM4WwKkLJlV1QSsCJuYhmoMNj4MbZNivxoc4gFAB9nVe/RY
 /mgRqddLohVGW71+h2kfx/u2OWkX3hK3IyGkqFd8guImMqyUoOGknoNDjFSKRrtaN84p
 j3u7VrYEz5a6kTH7TL3iJQlF8qKQqVWyxADB7qLLYF6pAU1a3icvvfco/5ptP25ft3eO Rg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twxw5hgfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:26 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OBWP59014241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 11:32:25 GMT
Received: from qc-i7.hemma.eciton.net (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 04:32:11 -0700
Date: Tue, 24 Oct 2023 12:32:08 +0100
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, Helge Deller <deller@gmx.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, "Michael S.
 Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>, Laurent
 Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?iso-8859-1?Q?Herv=E9?= Poussineau
 <hpoussin@reactos.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jason Wang <jasowang@redhat.com>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Max Filippov <jcmvbkbc@gmail.com>,
 <qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-riscv@nongnu.org>,
 <qemu-s390x@nongnu.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/45] hw/arm/sbsa-ref: use pci_init_nic_devices()
Message-ID: <ZTerOM9bc5B8v/cc@qc-i7.hemma.eciton.net>
References: <20231022155200.436340-1-dwmw2@infradead.org>
 <20231022155200.436340-9-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231022155200.436340-9-dwmw2@infradead.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dizOLerF3W9Ktgo_lllh00WJGa4VFPrs
X-Proofpoint-GUID: dizOLerF3W9Ktgo_lllh00WJGa4VFPrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_11,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=781 priorityscore=1501 suspectscore=0 clxscore=1011
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310240097
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
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
X-TUID: BTxf7a0J8LZt

On Sun, Oct 22, 2023 at 16:51:23 +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>

> ---
>  hw/arm/sbsa-ref.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 3c7dfcd6dc..582a28ce92 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -691,9 +691,7 @@ static void create_pcie(SBSAMachineState *sms)
>  
>      pci = PCI_HOST_BRIDGE(dev);
>      if (pci->bus) {
> -        for (i = 0; i < nb_nics; i++) {
> -            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
> -        }
> +        pci_init_nic_devices(pci->bus, mc->default_nic);
>      }
>  
>      pci_create_simple(pci->bus, -1, "bochs-display");
> -- 
> 2.40.1
> 
