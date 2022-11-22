Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3295882ejx;
        Tue, 22 Nov 2022 05:41:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7qs32erCX+7MqaXkeJH2YNmpXWd6xIMIkVaKFQ5zHWA4DRVKbFsnirB9SBt6W5NSPzttdm
X-Received: by 2002:a05:622a:4115:b0:3a5:e656:2432 with SMTP id cc21-20020a05622a411500b003a5e6562432mr6288938qtb.299.1669124471872;
        Tue, 22 Nov 2022 05:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669124471; cv=none;
        d=google.com; s=arc-20160816;
        b=rHesm9TaLt4of6gVJPenxMWLtxKKQzUl+TcF1MLYj2ALEtF4dLe08zUL5PDOjp88GZ
         J/l62cbFBSx4nM4+FEkI+NOpVs5gEFAKfhGTYFP8I+lB70mTkM/WJrVUml9rS0s0iINE
         n8UkfI6GGyGsmYDKlriYGZuE8ZpBYlfzGkptCfb1JizhyBcbcN4AXXRtVx5Xno7A6sq8
         XG11yrGOr4xCcGDLt807qfDSUFRdc4rtgY5iAdBHjgtpMRc3wUXrXSyCpra7aOqP/gcU
         kyZxYfBOqnBloQAtRgfYvO9w+mXcCQycKrLzhDONCc4s1GAM3CwdCL+sCQaM1BZCMCzp
         7+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eGZl5MR383EDLkMFu4CiNdwBldjRqi6X6iIfUUmsxA8=;
        b=i0vgercSRzakDk+QVxgV5XBGOrCvbLAdulQNAQt3V63KLLxoqE7UDZShxq1v086704
         XQSCzzLa81Ay0pCiZudSu/YwG9xu7AKMSWfUwQnEA9WTaYhx2ny7JTMnjUOOuWb1PGty
         shtOvy96B3rDwf4luZqWVYwkqaLblcabdt38wC+735imkpHsgo5q9SeNuO5+pY/XtYfm
         yby/xzURJmYzZNxvvqKIU7L8zZ8Yn80fv2DPRGkjXnpX4Mz5fA8lnUB/Os2j26gpyJg1
         tBpxFv1Q98D7rNkCAo3dXnYNgjvvD6VDCzrQHYRI993+Nzsv0h5a4K1Vh+WicnK3jUXr
         lNtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0bcxgO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w39-20020a05622a192700b003a52cbc3961si7763964qtc.736.2022.11.22.05.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 05:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0bcxgO+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxTW7-00058r-24; Tue, 22 Nov 2022 08:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTW4-00058J-6O
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 08:40:49 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTVy-0004ZO-1G
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 08:40:47 -0500
Received: by mail-pf1-x429.google.com with SMTP id 130so14369996pfu.8
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eGZl5MR383EDLkMFu4CiNdwBldjRqi6X6iIfUUmsxA8=;
 b=M0bcxgO+8tVCczv5IF63PwAK+NUaVlittdBTNM49YKHS2JVVnkXVfItQykxlV4bF7U
 9KcHZ00aEO2dqwJxqHBdDGrEHR3l+gGyGo5apn3UXc5kadMF04DqCPIBq2HG/nz2PVFa
 bgzpbdqIMwI+mJTxqUj8BulU/Qs0t7PvZTW3mT16LFGpKKmyI2HD23MS40ZObNn+PKmL
 2wwl1PO63MZr2vLU/ZUrYwNpWLvzjS4oUL5Nsk/+p86+FQOTtnJF61thDgYa345N+09B
 2a/Cq/3qJEBVcISg+SyjHxTTGJCmmKbqwHC+6SLRfiLcVvSUFroUE9i6gBBwpOMnlBPK
 vvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGZl5MR383EDLkMFu4CiNdwBldjRqi6X6iIfUUmsxA8=;
 b=jemQgfL31J6J5lnhRUR5gV7J7hDjx4vyKTCIVtMwVHNuzBYDHVATLHmbnjCY9HZFFV
 BMtDiEyP8GgcE04ZxJgfvvVhVK9jODOheiqrMOT6EWxH+VqEch/kypR6qVpVmdiHp7Fo
 duX7Jz49w3pinbUQsXyTObxtBCrTqvYEFw27vJalhou7ReWGVraoIwhJRKtIKTfT/ZA2
 zPAglrU5RY/LtKGNwMr1L5vOqiU/aUC0clt5vsn1PGHzCOtpUH2Nj+aNQ+Z71JrNPh4X
 tVNkKr3VcVa668tztanvHfPktbaKGKmW98LQ3cQ0Md4clolK9eESqLxHoxGonUSE7agJ
 TN+A==
X-Gm-Message-State: ANoB5pnAKzfpFYFqTWifE8VRZRNniAUW7noudLMiGx5mZ3RLhYaNyL+k
 /4VwpPXWYNEgBPf0VoQxhvPdRYDqPFO37javddNccQ==
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr4103540pfq.26.1669124440351; Tue, 22
 Nov 2022 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
 <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
 <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
In-Reply-To: <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:40:28 +0000
Message-ID: <CAFEAcA_LYASx7t9pNJs8BsQUwdEsNNq8P-a38PhJ36ivJFLRDg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: Yvr4lAPMqtjc

On Mon, 21 Nov 2022 at 11:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Nov 2022 at 11:24, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >
> > La 21.11.2022 13:02, Peter Maydell a scris:
> > > On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> > >> La 18.11.2022 21:11, Peter Maydell a scris:
> > >>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> > >>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
> > >>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
> > >>>>
> > >>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> > >>>> ("SMBIOS: Build aggregate smbios tables and entry point").
> > >>>>
> > >>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
> > >>>>
> > >>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> > >>> Is this a bug fix, or a new feature? What are the consequences
> > >>> of it being missing? Is this important enough to go into the 7.2
> > >>> release? (My default position would be "no", given this has been
> > >>> like this on the virt board for a very long time.)
> > >>
> > >> This is required by ARM SystemReady Virtual Environment [1]. As
> > >> described in the Arm SystemReady Requirements Specification v2.0
> > >>    [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
> > >> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
> > >> checks for the presence of SMBIOS type 19 table and fails the test in
> > >> this case.
> > > OK, so it's a spec requirement. Are there any actual realworld
> > > guests that don't work because we get this wrong ?
> >
> > We do not have a clear example. The thing we hit was the ARM SystemReady
> > certification based on fwts.
>
> Thanks for clarifying; in that case given we're quite far along
> in the 7.2 release cycle I think we shouldn't try to get this
> patch in to that release but instead put it in for 8.0.

I checked how x86 sets up this smbios table, and it doesn't
put any pluggable DIMMs in it, only the initial fixed RAM,
so I'm happy that virt doesn't need to do anything special
there. I've applied this patch to a target-arm-for-8.0 branch
that will eventually turn into target-arm when 7.2 is released
in a few weeks time.

I've tweaked the commit message to make it clear that this
is fixing a spec issue which doesn't to our knowledge
cause any guest OS problems.

thanks
-- PMM
