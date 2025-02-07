Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp386996njb;
        Fri, 7 Feb 2025 10:19:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1DQQyWv4yU7fHzdXrpIoeUfN7oSu/6nwzmtsR+m5EjsOJ6g52HnXLS3NlAnwVCLhlhMLchTfFmkP29g==@linaro.org
X-Google-Smtp-Source: AGHT+IFTMGWtM6sDNW/FDY/TTA8pJrN+dIjhKYCqLjfy35fWDrdJHovhSw55Okq90YP0sDRT4QlQ
X-Received: by 2002:a05:622a:1311:b0:467:86a9:f7d4 with SMTP id d75a77b69052e-47167a14976mr61003111cf.16.1738952371012;
        Fri, 07 Feb 2025 10:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738952371; cv=none;
        d=google.com; s=arc-20240605;
        b=k58O8zznA+cdUswGfwvXnc8fJTdb6iz0FEKY8lql0gFetitGyoHaXLYlJNUAM87IE2
         jTaFPjr3iWNxaPa35hPwqABtj+bg9SkIaoL+gENtItvr9eZYULCFSX24rz9ijaPiah8/
         VtqudF2mgMZhv1D4jxa8RyE10xQMpQeSKC5PcI1lmTCDF3Z2BVIKFtzt1wo7sD/lHvJd
         3l6nLt7TOKhSALvwhAVbaJX/s8bSwpdZpCeyAuOYDG4m1pZBzGr8F+0yqZx0smFob4rj
         g1aYNgAzPjscnfXjfUT3TOFWTk5njqS0Er8CLpXTKzpqNwWMxNjzS/mKjFsog1gTnBz5
         ZwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sdi96QWbbdoJJ0w1p8jGrpxBZ8s5CEFVHbHFU9ln8wE=;
        fh=ectrNbeNlG5Os3QYFCy/ufHPFGmJjOoQQ8hPc1p9PiY=;
        b=Vys0nb+IDCQj1DvcvZxDkk/vQIOg2WYtifxRi3sPgSXF2VSFuPbEq5vWU9nIQ6S16q
         rucIVqS3y3kQKaqBsj6ynQ9frCvCk9UvXnvkdIQmLsc4sYufBU1wUhrO9y7MlENyhinF
         WebgkPiReNTXUpJPjOJ/tcK8ovry9WsqEgJaRyREnWQAUpZtcMem7Lz570DLTMhuwgGS
         ZgtHTI4ENOi400g8SHe7SLV4UBb887GMp8rRcpRtCiP1O98m/V4P6sfjkGhAS3MoYnfK
         v6C980yFg522L0Rn1e43bIOg/JSqVCQrGNVOm4LlOSrX2I5LRxBrvmMpZ7wLdJZygFWW
         XSQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPqqZnPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4715ee0486dsi35708671cf.633.2025.02.07.10.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 10:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XPqqZnPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tgSwh-0007ep-3w; Fri, 07 Feb 2025 13:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgSwV-0007aj-Pg
 for qemu-devel@nongnu.org; Fri, 07 Feb 2025 13:19:09 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgSwT-0004xp-Hn
 for qemu-devel@nongnu.org; Fri, 07 Feb 2025 13:19:07 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e46ac799015so1750620276.0
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2025 10:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738952342; x=1739557142; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sdi96QWbbdoJJ0w1p8jGrpxBZ8s5CEFVHbHFU9ln8wE=;
 b=XPqqZnPJfpG7yYdNtl1LyjNaU7vgJysEp4kwdZZg32ZuDroI77jVuqt82bwdje74Fj
 zcuVa8feczRrFN4Nnf0vpj2wdyLLVxMgIVjItMVjZqt+YEnxtXkFmeEsJvN9KrOpj0Ag
 8MhFgQSaEavFv2DOMPFgLGLvZAThgIcDeFWjZBRUQf1vYh0hxp2sGTd23C9Yf2tP1QC/
 0iDjmEjb9HEPr2vaSrGsJxvlDLAj9nymN8SQePemXBvFMBKKyIRb8jvHikVCoJC0C3/D
 dkzWTY0UyV/9OQE2VZ94lw5l35GwO9LDUHNzVjr43ILvwlF88Tx/ds6TTqJofBAGA2S0
 IzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738952342; x=1739557142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sdi96QWbbdoJJ0w1p8jGrpxBZ8s5CEFVHbHFU9ln8wE=;
 b=jLMh0qXkm1SA0vBLDg4Sr89v8yqTLltsXsNPZLtfqMxQzw4WL3mzzuoLIec9wP5ek3
 LToXoNSC0Jz88gm52UogDFSb2EyqnvoYxyVn0VUAYE7ZmoI3cZU8HRmppD/iq9OMQm2Z
 ZIQtUhbeLIgrsEiG73fOvwjtaOlXWsr78WUdOWK2iyjggvXQQy6YNcAaVxyQNyPLDSVr
 kdw36csulzYOJb0VIZMIppRdnKJVCj5HL/ifVfdan0FSXwiVCm9D6WhFO0/1VgeQBmE1
 H9ZLvKtjltfNeCDulPWXpP0Yd8KjIbaEEG8nql2nTT5vautxUqb/9Sxrb0mA7/3OKKWN
 6n6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSIXXfREdllneLAGrcRNSAO9Fb2Yr5kDllopSOogA9zokc1WiOlqAUqrb169lEtTcpRqG9IMnBpzhk@nongnu.org
X-Gm-Message-State: AOJu0YwrxeOP/NNHF1VtXfnD6ywwaVK4OucGk7pqVOK/ebf0zx/lP6zN
 HG+bWtx1kbUUDg908c+DsLmK3dDiX0Ca1mo/42xDbXdD4et8ABBXF5jmILcaqZGz/wl0+uop5FK
 mxhlj0PgxDuCARYsyVzJGYuhVfV9/m7eroctbNA==
X-Gm-Gg: ASbGncvPx0XG2mjOOlEXyfjxYyw3bvkkhvLA+CO3VhoUp6MgUz0eKd17c2Ja4asx2ou
 EgfVjXJCVHAqMXi+nXyz8DB+H6paIDQQe0pj1bljS32jjlSyav5hn30Py1DuazTMB1RzJNlT+5Q
 ==
X-Received: by 2002:a05:6902:2291:b0:e4d:69c:f9dd with SMTP id
 3f1490d57ef6-e5b46191c35mr3415843276.11.1738952342230; Fri, 07 Feb 2025
 10:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
In-Reply-To: <Z6ZHTStx_S9ALdxt@x1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 18:18:50 +0000
X-Gm-Features: AWEUYZmaw6zwrQPaJ7PVZXkvrjecA94AUYs_3sJsMNUJ9FSoJqs4Jr-X3_WTThQ
Message-ID: <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, 
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T16rBlUMgfqE

On Fri, 7 Feb 2025 at 17:48, Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
> > (I wonder if we ought to suggest quiescing outstanding
> > DMA in the enter phase? But it's probably easier to fix
> > the iommus like this series does than try to get every
> > dma-capable pci device to do something different.)
>
> I wonder if we should provide some generic helper to register vIOMMU reset
> callbacks, so that we'll be sure any vIOMMU model impl that will register
> at exit() phase only, and do nothing during the initial two phases.  Then
> we can put some rich comment on that helper on why.
>
> Looks like it means the qemu reset model in the future can be a combination
> of device tree (which resets depth-first) and the three phases model.  We
> will start to use different approach to solve different problems.

The tree of QOM devices (i.e. the one based on the qbus buses
and rooted at the sysbus) resets depth-first, but it does so in
three phases: first we traverse everything doing 'enter'; then
we traverse everything doing 'hold'; then we traverse everything
doing 'exit'. There *used* to be an awkward mix of some things
being three-phase and some not, but we have now got rid of all
of those so a system reset does a single three-phase reset run
which resets everything.

-- PMM
