Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2414245wrx;
        Mon, 15 Apr 2019 01:32:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9+IiMMVgrZvI01FO24utVy8pSe0GG/5mAjhuuQPj5bjKPj0b4t6+vHC1jM1QMkZHUI7qj
X-Received: by 2002:a5d:5188:: with SMTP id k8mr47187700wrv.183.1555317165277;
        Mon, 15 Apr 2019 01:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555317165; cv=none;
        d=google.com; s=arc-20160816;
        b=nVMayAfzkJ4ytuR5vKa3QQ75nbeTPkvuZuTmAeEMxzkuvYvcqtR/UO46HFlIRdkrdT
         cmPy7TkbQeYSoBiCZZofBjkc1qAxWg9jP8sBdtCk3i4WGFMW5aQEw1/RywyQOITAeTjt
         x2fGPBnGYTuQ0ZtCjBJ8qYYszG7AGfaJElHzCug7Yg/AcJZqgHj3KSW78z/I3SuL1OI3
         kvzqKqjF/q7uwF2bWShdm0QZ+QA5Hump6bpdeIkGb+KdRjKWhDdpGO9IXQ/4/nwRIU5L
         /xOF9ZYTyPuCArBiFUj5v7mt3F/eIMmByHVJE9l5io7RcHi1LTLStUUZBnbmx+5TK3mZ
         crzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IF1vjwv5BhVva/kYg+s7myZNews+enCwUFgR59uB8BY=;
        b=eRyPztKMscFd5vhoHE7TG7TEl7wa70JMZCNJ0PExBtsSdw1ZbT+Ct6p4xrI3RquOlf
         O0oMwa6JlEhHwNcWwVCog/Mha87bV1GphviwvZ7lxs+APTJ6MlRVbMwoK8DQFFiqWHsP
         /I2oQjZYSo/mC2gj7GLHukklbP/A/SzNHsm0zszB7p+Zk2wY50qbTjIqohlb6uroKDpH
         QAOHupDGQA/nKURnobPl1b9KqS/kq4x8RPAngWfELNaGhdvSM6SG6n/Ul44QL65bhfZD
         69qOFwolyrjZQle9AwD+Z74OqrCRCpddIigR8ZSncdeJKhMvltSOPjO8JiADpWjNeyDc
         5gFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fdnU4PiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si10576088wmb.59.2019.04.15.01.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 01:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fdnU4PiI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFx2i-0006Y3-C1
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 04:32:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFx2U-0006Xu-EX
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hFx2T-0002sO-Ek
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:32:30 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:38030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hFx2T-0002qx-90
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 04:32:29 -0400
Received: by mail-oi1-x236.google.com with SMTP id a6so13046958oie.5
	for <qemu-arm@nongnu.org>; Mon, 15 Apr 2019 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IF1vjwv5BhVva/kYg+s7myZNews+enCwUFgR59uB8BY=;
	b=fdnU4PiItMcWtnEF1gJjIVvGY/Ax45BIjaPArBBIjQJSXzSU1Z90pNQ7oxOyofclIH
	9Wp2WEfmkKX+S/WgSUzxCSLN/2Sm58c5xNH1B3z4XaYoP2JBJa2sm3z9IcVv3yP8mOnE
	vg6sciEoF5s5B/Qi5vETyryzLeY4xOeJ+OgU4BJcJTgheO4XaulsVGwn2qs3MtvzgS5K
	57hSgAYFqkFQthKNrpaOQtNobzqOiHZQ+DAExwV2r0sHD4yCNCRs3erC6WzAp2xlVW23
	9dUhd+CRUtC8oNoFCb/3YCZrBtnUMYjA7bn3oMOrHfabBVi3iJrKlTOm1VK6DK+Pomvj
	awrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IF1vjwv5BhVva/kYg+s7myZNews+enCwUFgR59uB8BY=;
	b=PAIPFxSbyYgVmtwbvsqdzASGQm6EP8T4LyR29p1wSQ6/w8sMWwfGuJELyBl2X/vYSS
	EnBIUKtC/hGIyi9o3qHxMEcA+xSwwhCuRB8uQcGIxTvmVxge76w55aDZp4wg1GYHlomd
	/LVfc/Yy2J0gl2F/o9hVu8l8SeeGcKPTGtTA4BS/eeeBs+xBFhumEmqM5w3Nf3VdluHR
	GQVfr7ONmF1xdhcPkivwKeK2jU8OmJKPOYIOgWrZupg0TX6QUrFWF/cQKCY+X8eY9cwC
	okVGe6h8xW4bSdonTFSX8zmiQG7/Bywmo/noKSAMilL0Dun2X/tTUHKaAqaEwFioJHKp
	VNXQ==
X-Gm-Message-State: APjAAAVIui7ssYEED3Bc9sSIxg/Ru+7uox//SnkoMktwD70MmRILQ9Im
	4fuWs4ptVxN2NT0C8CNlzWUw2SSTNBQJBvpFjWnguw==
X-Received: by 2002:aca:4c88:: with SMTP id
	z130mr18714016oia.170.1555317148238; 
	Mon, 15 Apr 2019 01:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
In-Reply-To: <CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Apr 2019 09:32:17 +0100
Message-ID: <CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
To: Da Zhang <daz3@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::236
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: naTk6/h/xj6S

On Mon, 15 Apr 2019 at 06:27, Da Zhang <daz3@vt.edu> wrote:
>
> Thanks for the suggestions. Unfortunately, neither virtio-net-pci nor rtl8139 works for me. Yet, I haven't figured it out why. But, I found that virtio-net-device works for me.

That will almost certainly be because your guest kernel
has not been configured to include PCI support (and/or
support for those specific network devices).

thanks
-- PMM
