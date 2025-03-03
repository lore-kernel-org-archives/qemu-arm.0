Received: by 2002:a05:7022:4195:b0:99:f831:508e with SMTP id i21csp867397dli;
        Mon, 3 Mar 2025 12:45:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgv26EJJqb4BG984NT8o8vXjdcr+qjBYtbtbr8zrZ4/1zmupk829HSJlkEJwRSuTysf5XQiTCTT6rHuA==@linaro.org
X-Google-Smtp-Source: AGHT+IHiDCVQvVNUNtXgiXmUxORriRsqPZbN5HF7v10yQEaIYj/roHRqko0jZbhBCl2teIbZCxsM
X-Received: by 2002:ac8:53c2:0:b0:474:dc44:28c4 with SMTP id d75a77b69052e-474dc44399amr83206151cf.38.1741034707486;
        Mon, 03 Mar 2025 12:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741034707; cv=none;
        d=google.com; s=arc-20240605;
        b=Pb09/le5N+STjNtp9B0YiBTf1Dkg47boIEH7x7A4hj2i+3+GejVtWKUZwKJZdpc2vE
         uRY15lgY2v+PGN82g0Rk61dxgGI6p0z/vFy7H8omzkj6opNT2XtDhWDRVmv7ddSkbZKg
         nGdAHcp7H/R+mm7OLOJvQU+hi0IPNfn4gyvQ4mCixhUiKysjGXdRhOFcNWMW6PthGRQ/
         qOrEaKxt/lpy8oZT2JZ970q/MNSsxU5EDU+uid3WPQq8BySAt0fhhLlicXXtaOlNMOC2
         4IRlGZ8bSIbO4ePBXEP86RtAyHGN2nwEAEAIC67cWYey9OrxgkkdIKANVbu1niYL6yfs
         orfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Eb+8IeIfgwFwqfNpEBukyROOFzwPNkiWo0719T+6Xmw=;
        fh=u+YiaU80A92EQZrg9k9tmDG94Yv/AULoF5XbyewtLUo=;
        b=ad68TemHsGXG+NMLfhsi3BfWRkzJi92DAyzMWDi0jVxUzWKAgq7op3rI90xHrqwcP0
         tNID3DXajTPgA8qymmyB+xZNbaZnMdL5yd14uanM4LDsnliwicA1InP846JKVcY/fB8j
         slc8ierttKiCiUo8v9E9ijjGZqisXkJXuOazSMjTUxrtaRUzDLY/ZC8DVs6a5nhzrGdx
         Wq+DLGS+fClx06Nuw9n5PKcYHNxrZNSz5FYysLaXrZZczdmXHj9rte+aajm7Q/cB1o2n
         N++Qe0VG/2ZQLjpUX3f2b0IYITVD7PMSLv5tsMMd3H8uq32RS/dfLnk5MNjVzMDqszOq
         ILBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=apsaAYvs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474fc1e48e3si2690251cf.77.2025.03.03.12.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 12:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=apsaAYvs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpCeg-0003l5-4F; Mon, 03 Mar 2025 15:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif.lindholm@oss.qualcomm.com>)
 id 1tpCeX-0003io-2G
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 15:44:43 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif.lindholm@oss.qualcomm.com>)
 id 1tpCeU-0003H3-R4
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 15:44:40 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AmPeB018110
 for <qemu-arm@nongnu.org>; Mon, 3 Mar 2025 20:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Eb+8IeIfgwFwqfNpEBukyROO
 FzwPNkiWo0719T+6Xmw=; b=apsaAYvs1LyKR+r3+4lXq0jPoVqB221iNEfDi+qq
 SxJFLFdfSqCpVV87wHvFoDqX6lMTb1NA2KNNJHTS6pKjMQBQAWlotIJDhDjUePEL
 PH2M+slnxJNmRR5VPGlAPVZtz/KS6odtxTYBnJGp3xJa/nqRtrJup02l0psWz/Tu
 ePRd7Xc1D9TvrRq7RDtNO4jxbXAeKConF9nkJTd6wLqFos5UXM7YhQZspt4vhGA9
 exRJwgjClS3jS2Yf2UJPSttq5F2x7M3ynU4JTyXGyScnGi5XN08bLs+b7GzheX7Q
 ldBRVDYb3sfcFNf6W8bJOzNd0e4CDl6VqnpFb8oOy7Eebw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tf0nwcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 20:44:34 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fd541f4b43so38859557b3.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 12:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741034674; x=1741639474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eb+8IeIfgwFwqfNpEBukyROOFzwPNkiWo0719T+6Xmw=;
 b=bc1KGFaGVYIOvBbsTGTPAwyJE0085lZlm/VtAmro0uivy7zTT41bpKQGd6S8fBMSmf
 w+YzyxF3TwAxxj+xVQq/o5hjCfDcKIU6gNv22Oo9PrhpxfWYw967UplBTOcOOwuD5QVN
 NENx0yTSLPy3talVnFOsLznLrhosvG99zBFoHemEWybLPXNenYgfLB3grHvvBIvNx/ax
 BrMv8Ahlh8dNffLPZtXkVQQgxJtLZHL5CESO4e7dLDvngKjMPLf8oqrk4sq3kZ4VX5Ii
 dCIogoWPWcKdj4v1yT1z4X5l+hDt9FNOvOXD9ccXwMfL1OlRx51dGc7h40jNQ4Fv8imn
 Rwmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRzSOx3z0yE6Z3c2L5gGWFjC//UjiEdNvTCPdo7cCuCXNZALbTfWr7JOmmz01wi00gtoT++nsFgQ==@nongnu.org
X-Gm-Message-State: AOJu0YyVTvdYuyKuX4k5jQvr0cIOZkdnEReIiTde4V0bnsNaEKmGCn7m
 wwASVoo8VH1NSzDhjZFZ6a+xwFNNBHGxtUubVfDyqdM5w3RuHX4hA3WwJ8ezvwQct6sI1vGVyiT
 1IIrl0cw7cYlMG2E96jBkIR6i0jvkHSSTB6jhpPl5qDkzpeduXPKls9N+ejremorhxOf1bmZ0Gb
 qKyJ3BBgHg6oTN0mqNaWw+D4m6ug==
X-Gm-Gg: ASbGncs+f6Iilt7TMBUiUUKogsNFxN0/1ScFBJ7Ih9Ghi9hMGr9eBmUVtq42LOxjaqH
 QJRJaeS0Je98N5c5q/2hLAkHRYm9k24teGDJtD9jUkr6OBpbADZUrwzA5TPM6ff4+kILt2v0/JD
 vonqrQA9pUJHCR8gxNUl8Lbw6YDWIn6A==
X-Received: by 2002:a05:690c:74c9:b0:6fd:369c:635e with SMTP id
 00721157ae682-6fd4a0fba64mr221123807b3.16.1741034673736; 
 Mon, 03 Mar 2025 12:44:33 -0800 (PST)
X-Received: by 2002:a05:690c:74c9:b0:6fd:369c:635e with SMTP id
 00721157ae682-6fd4a0fba64mr221123567b3.16.1741034673406; Mon, 03 Mar 2025
 12:44:33 -0800 (PST)
MIME-Version: 1.0
References: <20250225074133.6827-1-kuqin12@gmail.com>
 <20250225074133.6827-2-kuqin12@gmail.com>
 <CAD=n3R2kuvUzyE7nKPmpyELozdo_+eAKVr_CxA5HQ_jLL25stw@mail.gmail.com>
In-Reply-To: <CAD=n3R2kuvUzyE7nKPmpyELozdo_+eAKVr_CxA5HQ_jLL25stw@mail.gmail.com>
From: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 20:44:21 +0000
X-Gm-Features: AQ5f1JprlG5Sgu7UcZuHcTwErsEB0-U0S3xSc2buB1mmfQIoDfpU4ZFqvaFi8rU
Message-ID: <CAD=n3R0ntWYNN9LxJWVXApY3s_LRddx4YVQPYRzRojXcL-BDug@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: Adding TPM support for ARM SBSA-Ref
 machine
To: Kun Qin <kuqin12@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Graeme Gregory <graeme@xora.org.uk>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: d9TBvq3qNX9ndUdEMiLWf6kU31v0st2B
X-Proofpoint-ORIG-GUID: d9TBvq3qNX9ndUdEMiLWf6kU31v0st2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_10,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030159
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=leif.lindholm@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9DLfpJHpwEho

Doh! Add the lists back in. (No idea how I dropped them off.)

On Mon, 3 Mar 2025 at 17:02, Leif Lindholm
<leif.lindholm@oss.qualcomm.com> wrote:
>
> Hi Kun,
>
> Apologies for delay in responding - I was out last week.
> I agree with this addition, since a TPM is a requirement for servers.
>
> However, to help simplify review, could you add some detail in the
> commit message
> as to which SystemReady requirements this resolves and whether this
> implementation
> fulfills all requirements across BSA/SBSA/BBSA?
>
> I agree with Peter that since this is a non-discoverable component, it
> would make sense
> to step the machine minor version number. A major version bump would
> not be required
> since simply adding this component will not break any existing
> firmware (which will have
> no way of knowing it even exists).
>
> Regards,
>
> Leif
>
> On Tue, 25 Feb 2025 at 07:41, Kun Qin <kuqin12@gmail.com> wrote:
> >
> > From: Kun Qin <kuqin@microsoft.com>
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2625
> >
> > This change aims to add a TPM device for SBSA ref machine.
> >
> > The implementation adds a TPM create routine during machine
> > initialization.
> >
> > The backend can be the same as the rest of TPM support, by using swtpm.
> >
> > Signed-off-by: Kun Qin <kuqin12@gmail.com>
> > ---
> >  hw/arm/sbsa-ref.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index e720de306419..93eb3d1e363b 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -28,6 +28,8 @@
> >  #include "system/numa.h"
> >  #include "system/runstate.h"
> >  #include "system/system.h"
> > +#include "system/tpm.h"
> > +#include "system/tpm_backend.h"
> >  #include "exec/hwaddr.h"
> >  #include "kvm_arm.h"
> >  #include "hw/arm/boot.h"
> > @@ -94,6 +96,7 @@ enum {
> >      SBSA_SECURE_MEM,
> >      SBSA_AHCI,
> >      SBSA_XHCI,
> > +    SBSA_TPM,
> >  };
> >
> >  struct SBSAMachineState {
> > @@ -132,6 +135,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
> >      /* Space here reserved for more SMMUs */
> >      [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
> >      [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
> > +    [SBSA_TPM] =                { 0x60120000, 0x00010000 },
> >      /* Space here reserved for other devices */
> >      [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
> >      /* 32-bit address PCIE MMIO space */
> > @@ -629,6 +633,24 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
> >      }
> >  }
> >
> > +static void create_tpm(SBSAMachineState *sbsa, PCIBus *bus)
> > +{
> > +    Error *errp = NULL;
> > +    DeviceState *dev;
> > +
> > +    TPMBackend *be = qemu_find_tpm_be("tpm0");
> > +    if (be == NULL) {
> > +        error_report("Couldn't find tmp0 backend");
> > +        return;
> > +    }
> > +
> > +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> > +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> > +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, sbsa_ref_memmap[SBSA_TPM].base);
> > +}
> > +
> >  static void create_pcie(SBSAMachineState *sms)
> >  {
> >      hwaddr base_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
> > @@ -686,6 +708,8 @@ static void create_pcie(SBSAMachineState *sms)
> >      pci_create_simple(pci->bus, -1, "bochs-display");
> >
> >      create_smmu(sms, pci->bus);
> > +
> > +    create_tpm(sms, pci->bus);
> >  }
> >
> >  static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> > --
> > 2.43.0
> >
