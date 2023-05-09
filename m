Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2728307ejq;
        Tue, 9 May 2023 06:39:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qptXJjiHiLhgCtic6XLsmUTtc/yu5pja4BxFG1SQoMG4zaF9+Iq24sYZMtJJvdwnL9VtQ
X-Received: by 2002:ac8:7e91:0:b0:3f3:a1d1:3001 with SMTP id w17-20020ac87e91000000b003f3a1d13001mr1203734qtj.18.1683639562319;
        Tue, 09 May 2023 06:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683639562; cv=none;
        d=google.com; s=arc-20160816;
        b=YZwVNlGb6XMnaDHcVSUlqt4f8KBAMKkgLxY2/lBWJHBDDhq8YllJsfEzIicrQAKPv9
         duDMTVkeK2LD44KlgImNn60gzjOB+QYUhZoDYUtQuRM83ASKThpC/IBB3jVbzUqblVZv
         W5v3bk++ZYBLRxyI1e5I6hnRPo5chI0ZERvXcDKm9e9t8X1XsnD7AOW2MSD1vxrOjJzX
         Sy/r/62oYWmvmkdDu5c/HRV/uAcTNGjmi4KVICBx94pHDpAD3wQpQ0/XZhB/ZzLwWtIX
         IlnHWS+shiBoKvVQPp+7x3OTRCCG3tJb3A3L9BPOyCllDgEwuptVhL6uWNsG+7wBjXrg
         n2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zTewEQMFLK2T3sUaVCP8le0EYo0se9/8F0qAzKhz/dg=;
        b=RrLY2wUITs/SR0rJnJsJRxdTlkiEeQx39TtUTQ5ItjCUh4itOUW44pV7yAXZUKxAUG
         IxuvUJuzvuZiDr1KZ+YxBmANnATlDFdjYBCe0G48sXJPRXj5UfoOI+TXqRDCW+Xkaijs
         ymKpE+Kc17DelTOVX4tMvmeT32aln+jH//Eqr7ehyEYkmPvjK9s0kBdMi7O7BJf72suz
         FM8cdQPVI8KgEJnYwnndaIFvPBoKiZHNYB67qG+dMeWoq7uo91jciVUyPgCzufxdWToY
         kS+RYUNoRkDsE44FjRRLbfc7B9xeybkb+sl9vwyqGzAYneEsmNwPvVT3ImMfNxlBxfDT
         uJng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIk5BO9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020a05620a039100b0074d3a84b4d6si3905733qkm.141.2023.05.09.06.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 May 2023 06:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rIk5BO9Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwNYU-0005su-JL; Tue, 09 May 2023 09:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNYS-0005sC-OW
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:39:00 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNYR-0003en-0l
 for qemu-arm@nongnu.org; Tue, 09 May 2023 09:39:00 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so59059693a12.0
 for <qemu-arm@nongnu.org>; Tue, 09 May 2023 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683639537; x=1686231537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zTewEQMFLK2T3sUaVCP8le0EYo0se9/8F0qAzKhz/dg=;
 b=rIk5BO9ZqfNZrSo4XCgpvI+lAiHRS72ZW7GPGzUsvYNgnEyfH8V7B9aYnPqhpO9mkc
 c4GSj0GsnRma8HgeMFrSv3uz+KWixLHcA3MEs3NVO1GpdvrjwU/eRRH6feC2rEHQ3QeX
 d15zl8nHk3gzM5CfnMCIUuxJa51QjiFylwgh1A4AgUtRTwtLiVQIz5pjll8ewV0KXCK+
 xDs2YlztXVB5UQeWQaiJR2Negeg2OzFQKNm8xqBncFMEGZk4TfS88uoZZjD/3HHlS9tJ
 KW6sEIi6kigUl70rel717dVFJ8hCRgiAJICBJsqo7vssbje4yBeEdiuQpKtmHWhnCraz
 IKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639537; x=1686231537;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTewEQMFLK2T3sUaVCP8le0EYo0se9/8F0qAzKhz/dg=;
 b=ShFftbDUBvQmfBzmrSha24bK7naXEQVdCTzNiC7AeP6bm/B2kUeJg1SN7+VGW76oMG
 WA3MsEi0t2BAIVh1YUB+7lOTaMiq9FrWR5lEPgAhY1lRKoICU9OJjbAIPP+5mB3p7scg
 uPfJ6uXdbqvHF06mpC/evRHAo1pV+AfdfgV/j72zd1hYqOeHRs0akhTBdR6RAPLMZRmi
 S7oMXBusOnSxhG42HaRzyCxLlt7Gv4i7JVIV0xTEAX3X/A2zL8CeZt0MI7iBiutZMVVL
 XrT4MS+0OllNM2AsQ97+IOxQ/vdvXgNQi2i5grLbEjG6fXzt4WCeyM70Gwd0ywYUNMGQ
 0gGw==
X-Gm-Message-State: AC+VfDy9wScpy7Z5S/gDBJpqPVmu3huLUSgCZ/M3gd7/X3hPSLrGgRaz
 /CCuWv1/OrWU0XGVHd5hQmOWmhNF1IijgKPLPHY8lQ==
X-Received: by 2002:a05:6402:26d2:b0:506:c2e6:f69 with SMTP id
 x18-20020a05640226d200b00506c2e60f69mr11276764edd.6.1683639537414; Tue, 09
 May 2023 06:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
 <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
In-Reply-To: <e4ljd7cckcoe5s3cphztjjqacswssjkap3l3dtre22rtew64kq@cbo7oi7s4wow>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:38:46 +0100
Message-ID: <CAFEAcA9wk+UOO76myohS2tYXYJ9zHFxr9ARdg1w3QUDXBUQv+w@mail.gmail.com>
Subject: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Yuquan Wang <wangyuquan1236@phytium.com.cn>, qemu-arm@nongnu.org,
 rad@semihalf.com, 
 quic_llindhol@quicinc.com, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4cptPntFhvi7

On Tue, 9 May 2023 at 14:30, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Gerd, is there a particular reason our EHCI controller only
> > claims to be able to do 32-bit DMA ? Should we give it a QOM
> > property so boards that only have RAM above the 4GB mark can
> > use it ? (Would the x86 PC benefit from allowing >4GB DMA?)
>
> Can be done, but it's more complex than just a property.  All
> the EHCI descriptors exist in two variants, one for 32bit and
> one for 64bit.  The current code base only supports the 32bit
> versions.
>
> Alternatives:
>   (a) use an iommu to map 32bit to 64bit dma addresses.
>   (b) use xhci instead of ehci.
>
> I'd recommend (b) as the xhci hardware design is much more
> virtualization-friendly.

Thanks. Leif, do you have any preference there?

-- PMM
