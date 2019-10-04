Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp377617wrm;
        Fri, 4 Oct 2019 05:29:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyunFu1IXhLaP2yw6OmsY81AXfPAQRqurRTGNJ/IOyy9rAkBPEHblzq4A+fgTivyQpt+TtG
X-Received: by 2002:a05:6402:383:: with SMTP id o3mr630732edv.205.1570192149467;
        Fri, 04 Oct 2019 05:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570192149; cv=none;
        d=google.com; s=arc-20160816;
        b=vqfaQ7pQPqPNBEtlbbf50MmAX+kYHTQvfAw6mVquLX/kP7kzyVDCIe9t8l26Muu1jc
         0DLi71NCppeSJuDFt3NWzmuPAaHMePHIf+46f0oalDhzWm+nDIsmhqAcXhdVznUf/ncy
         GEIrqJGpHb4BlDWe/jykkJfcadIqnaMrAvE/a9ctZRvwLSm6wWAZzY8OvDOIUF57hJO2
         3EMd9cO9wx2hJjOvHPxuDceN/QLaaBPbspvsEVIFqFecDqN/KUNffyTxDKh8RKh/2t+b
         u1zTkPhs/zeNH6/8NpxDGWb1OSWGY9LX2g1thg7ql6Qbe9+xgHpLXOnmTmO/YJHFf26c
         1DfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=/oQT8DN4K81lAulpObLL8omqgqhNuiPwlAvoiwKSXCE=;
        b=uJzY2QLuQ8ToePyHagGdCN6RuTYMuNd8PvFCMU6jujof6YdJaRj57YOChqNEq5pOMe
         nj77XcQAnchCgmBWMrG2enTNSeTFBUu7ibWnmxWiVV9ueeBkhxzS7MLXmo+oLYUZmOgH
         l8FWx/+95TYm1R+UXmRiyDd3xftM9pAPSteE7L9SY74YT2Tmi7Mfoj9AjHOjaauXHfIj
         swWNMtRbESttcMz95vYiW9oTez0Np3VhWydZjRSUyYp71N376Ak6AFFZ8iM7WxF4pk4n
         vkLc/W6mOqMw2N3b20M6oxpeVnbbPzy3NGWEQz72P5NMxRuha9rhvCiMkRuOEFL6io5M
         yPMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f45si3579730edb.166.2019.10.04.05.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGMho-0006oo-Hz
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iGMO8-0002xy-LF
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iGMO6-0003Nt-7f
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:08:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38596)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iGMO6-0003Mv-1P
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 08:08:46 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D416E8E3C0
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 12:08:44 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id c188so1527700wmd.9
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 05:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/oQT8DN4K81lAulpObLL8omqgqhNuiPwlAvoiwKSXCE=;
 b=dA5VDw0qCZX4N6zn6/dK9O5393u/9j7A/t/uh4WZUUk8l1Q7DX3f1PLaS5Uu7vpf/9
 nOsCYs/+E95ZavXQYBxPVarYvi4y5L2v9Z11/8j46dKuDd8kZpId13LwTByF360/1xyr
 7KVO/xmXmAkaEd6YmFiZd8y3Y2LIhYkcOSkrfoWPDnGViyH15uMbCXBYS0K5x3jIMHpo
 GUmxKx7bfMLvlbvBrkcUfqhjOuS4Fx7yq/XW/c1ZKmPdPMnfrF9aXpWLsbPAfjwF5e6t
 +yskCrrzImIXUsv153ON53+C1FrIDLNOOhMbGbgHQ+/d+mQxwM/a0rbZhmQaf27SF77H
 ZsvA==
X-Gm-Message-State: APjAAAXUSwIzNc7EkmG7TtCciMYs0g1l8o3ERgiRwQN8S562549PzH6F
 BifNiZmKsu7AzJTPi5ZMpeBOsgt8v0WFsO5KIlauPoNqCSRIQ3UsuXwvbGG/Uw4QZrNjUkgtqDr
 oOj/UNpSSjKNapyM=
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr10605882wmc.111.1570190923475; 
 Fri, 04 Oct 2019 05:08:43 -0700 (PDT)
X-Received: by 2002:a05:600c:2:: with SMTP id
 g2mr10605862wmc.111.1570190923216; 
 Fri, 04 Oct 2019 05:08:43 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id w17sm919268wmi.30.2019.10.04.05.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 05:08:42 -0700 (PDT)
Subject: Re: [RFC 0/4] transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191004114848.16831-1-peter.maydell@linaro.org>
 <2edcfdab-0682-2728-2632-e4f5bb6cd7e2@redhat.com>
 <CAFEAcA_cReY=9a40pJ3J1esWTEise-Q29DPqVgm9AAHx9FesvQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1a424c17-4ec0-5cf2-4fb7-b8b8bb357f6c@redhat.com>
Date: Fri, 4 Oct 2019 14:08:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cReY=9a40pJ3J1esWTEise-Q29DPqVgm9AAHx9FesvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lx59mAeq9sNn

On 04/10/19 14:00, Peter Maydell wrote:
> No, because stop/run causes the ptimer to "lose time"
> (we stop the underlying timer and restart it). It's
> very common for a device to want to change the ptimer
> properties without a stop/restart -- "set the ptimer
> count value when the guest writes to the device's counter
> register" is the common one. Of the three begin/commit
> blocks in the arm_timer.c conversion, only one of those
> involves calls to stop/run, and even there we only
> call stop/run if the write to the control register
> modified the enable bit.

Ok, thanks.

Paolo
