Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2907740lfy;
        Thu, 30 Jul 2020 13:48:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn/rQMMrD7bGCT1JPcSKRlfzcPWygSSrbQLDMWrOzlkijrTfX+PvQf38N20bzW3Zap5NyC
X-Received: by 2002:a25:782:: with SMTP id 124mr1268923ybh.280.1596142120502;
        Thu, 30 Jul 2020 13:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596142120; cv=none;
        d=google.com; s=arc-20160816;
        b=J1rdnVLAShENkJO2E0RlrV8IKLZ0hCKPSNQWRSma2cSrw9x3LXpCZCCM7ty8vOqT1X
         XvYNmzaWX+ICqfYY35WNo/26dQiyU7kX/KAxjbY5UM9JuS/JGEtUu3QwKLmg346tLO9j
         vSwM4lGJez8M1bEYNOjQyKqxdb4iEqQPtMXpp2i7ZtKz1HIgG2yC1gSzrX+JIKBExAiy
         8pQ1Ppkt3oXrU+Svm0NmJaRLiJb4+yIvde3vrzomDCFbZqnToPprbnATkL98TQAQ0zxe
         KJl/7r1ezDliwwhrZYbeBYW+m3bhUO4cBmmMXYhed6ySJXA8rfGqEZZECJztAEUEy6Bn
         74tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=clMIo+lUj5/CKd61OQMVlCao7HwZk9bWyZ1KAxmdVq8=;
        b=ZFZ+6nR7XtpEzIkoZlBI+ssJvmrDsWgiGimrGIX0//CXL8EuKRlTZ84+iPdVcykgVi
         2oAcUnUr5y1f4Slqc3D1lbS8cqds5MU4ARnAogDZKixlvpkk2/jsHLyOuqus1+v6E/Wa
         K/005HQtnBG39WHS0Yq45Y6LVFTVMmQiv86iYeuIXbXTPithlmIMsGrUoKiH7rkkl/xR
         JUJWMYMD60i2qwVPMFks2rmp6xrTsowPoMAkwj/n1m/JpPHoEcC5CuNjuLwI1u7ywFKu
         e3mKpdcpWSsMQCaY08UJvZOIfmeF3MtdDgRLIJ34kTkE3gu5Xfu6WQzP9ZxMALcFM2X3
         53sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zFd/cDKD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si3299261ybe.452.2020.07.30.13.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 13:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zFd/cDKD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1FTj-0004IT-TH
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 16:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FSQ-0002yT-H1
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 16:47:18 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FSO-00070i-Gj
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 16:47:18 -0400
Received: by mail-ot1-x344.google.com with SMTP id o72so15533312ota.11
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 13:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=clMIo+lUj5/CKd61OQMVlCao7HwZk9bWyZ1KAxmdVq8=;
 b=zFd/cDKDtciNl4hStC3++xrFLYpy/vH+vKwOMLJW/URxn0Gvw4TIOmUYwh2l5cUhUT
 xxWedjm5Itq3R34efSiF99peisoxivn2nAvKKFEutgvXf3GdeA2DnzmosNHi2U/ahsKq
 RbTH/jUJJ2wD7koU8q2Te09anag36Kn/Ngv34UaOEx2LrXT7r32eb9qPTqP+q5chd7OJ
 +64PJA5RyxmvOWXwo4Ro0p1kfrpvberDMXCYfHMJKidRyCBFLinDSm9LBPaGJt0mb9rm
 AqJ5i7jU8vWU5u6IODv5PKT0lxLokfcAYXafEHALssjjUCiA+vrkdvvIO+cmU3Er2tk6
 5nQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=clMIo+lUj5/CKd61OQMVlCao7HwZk9bWyZ1KAxmdVq8=;
 b=GFgddIRDN8xEboIT1mi1ZAWOCdn1zQYiaRkDeVN6Zd9w0QXR8LhrPhHh2S+3v1YHKi
 3TYg2jyQjc0H7DmQ1lwsaIlrdl0iZS1QFo+Gx608ypDKHFlLacZlNQRybDClsaOGSFom
 wmncFNG2hScGRiqRrH0/z7IdBgQFBGXWmGbOKbjYEm9yeE9EGlrFlAaBQbbA1txrxv1L
 bfG+CsXO7mlWljOr8nSogDqWXGpxvPWud1ZeJGCW7wfVp1KMlvlQXVLXfRSnhbRtoCdW
 3CCEBZ4TV/KgBEntm/KGN6ECzcqADBHMf14AFIdEodm8yDeiNcpymU53C6jN9kf5yuUK
 O/Zw==
X-Gm-Message-State: AOAM531uI9C2YR2L2qXVCZNnDy9hDd2W3PT9+jItpOgfen5PSfYhcfMr
 e+YU/TBiSxxUSHnkITtbvIaiyRKzmjZ7kPscZFD/oA==
X-Received: by 2002:a05:6830:151a:: with SMTP id
 k26mr378426otp.363.1596142035292; 
 Thu, 30 Jul 2020 13:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
 <1596110248-7366-2-git-send-email-likaige@loongson.cn>
 <43e912f0-4383-93c0-ccd7-204c7eaf9850@redhat.com>
In-Reply-To: <43e912f0-4383-93c0-ccd7-204c7eaf9850@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 21:47:03 +0100
Message-ID: <CAFEAcA_hoiEBjvUnjLPUxgJbo0hUk8JPwmGaV7-iyTQGJw16nQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Fix compile error.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kaige Li <likaige@loongson.cn>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QwmtJg60T12X

On Thu, 30 Jul 2020 at 14:17, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Again, what compiler / version are you using? My guess is you are
> using an old GCC, and I wonder if it is still supported.

configure complains if you use a gcc so old we don't support
it (our current minimum is GCC 4.8; Kaige is using GCC 4.9.4.)

thanks
-- PMM
