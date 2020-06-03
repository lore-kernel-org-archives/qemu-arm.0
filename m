Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp547592lfc;
        Wed, 3 Jun 2020 07:23:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEB1OzkgxLqpYbW/wmyfMH3Srz6MMFa1c5i7CZizWUiHI6Ouj1G7maQFtLjNFQoIMxzouk
X-Received: by 2002:a5b:512:: with SMTP id o18mr193718ybp.139.1591194223957;
        Wed, 03 Jun 2020 07:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591194223; cv=none;
        d=google.com; s=arc-20160816;
        b=J5z+eeF2TaceUbp6xmXYuuFpnn5bEN++yOLlNJCr8FUAY8i1GIpfUUcPfHQuoO5HFp
         BG3m0PE6RTLzX19p7KRomEAgLzoXw35bWFN6l/ghh45CYmN9II8PfOyKYOP5ZqHCA+xI
         Xcp6fgKdjP20vL63PvLvPg7rzzr1W2FDuhZ0EcXCzdKE2TkUjRgJnebhJGOYW4ENUL3H
         bNYfFrRHAaAsXuSV7+OSw4lLAAUflBWYPFC1bj+uHDAMyhQUWNM9wLofioXoSRDMeSFb
         dOdxJM9IF8hYDgFVwwYkRgCtrXH6ub3wVehBTVXvanaADJAblLJcN86XkwnNvvFY6glm
         O/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKpdP9vGeB1tX9GzeRCGf8yJGZXxg6QS3w22hbJrIK4=;
        b=HKqtLPxZpgnm5g0Oo0/mFhcs9tXp3VGn1ukmqTNIjannpP+0+a0yS20Wzn/J+Av12z
         IHm/yKCR5vAy/z/l8zWJRL/SDJxu2pOcTCaoJ0md731evg6YPiKFV9sTheMinC5P/Uvk
         pJLTcFWUToapTUvJADE963Fl1UdvNXdQnddSwYpqw0MDcvNqSR6eZceLTQKUqMLApHjV
         jmU+35uL91WaqyjjUbR3EsmylNisfpSawHQVXz/T9YhrGqV5tFYT6hK3arNIF/f6k0AS
         3Uf6PejVIp9Kq8XV6BPNP+mRPSDXorwdfzcKmfoL7XU48/fNMwj3N55+7mP+8AQ/WEdt
         daRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUi+9uGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si1883275yba.215.2020.06.03.07.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 07:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUi+9uGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgUIx-0007gf-Bx
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgUIi-0007f1-6l
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 10:23:28 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jgUId-0002Gn-CX
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 10:23:27 -0400
Received: by mail-ot1-x341.google.com with SMTP id e5so1969689ote.11
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2020 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SKpdP9vGeB1tX9GzeRCGf8yJGZXxg6QS3w22hbJrIK4=;
 b=SUi+9uGiAO/LUAVKBf8pDAJSH5KK+B4ZSCsRV7tQjDdT6L+/jVMq6zM6QtyBn7zZTV
 Vh7pX82VAc1uLX1LBaBhhkLgpdAbaW/zDooI/hjn+saEhPZDCsKrLJavkLBHdZQdGDoD
 kqZe37hNh1eD9VU3TxWIQ7I4mNoNhaik5wk7iOnqvOQhJ+KvvaCw+edcym4NhvBjjzPx
 IUJTY58NUSJtyimECW+GLw7TVpEgbX8FKYsZ+4lbz2j8DxeKtB1dvjjnjQvrS6qCwl3a
 YuncIuFXsxFtJivmbfGZ19zhOG3SmC2fct9RAyHwDGPxbESEFM4MvpW8N1FNc5oi/pLs
 CloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SKpdP9vGeB1tX9GzeRCGf8yJGZXxg6QS3w22hbJrIK4=;
 b=fAtPiU1Dz8yAXlB5Mhcblfidq8qX+nRhVgEeL6kOmfN0VR7sDZZEA3RtBrRHyB7p+U
 XUeYpeA7vZQjr4C3adQ4XdtrGOE0hdenXsPAQHlZxL7Byw2r/rhduhsWEPFaIODt1qjO
 xsA45aIRoClw3BKL6DheY5IFymXFvquXm2vnOH7xDC7YHtXyvojXDvedtuIPi5OkfFMj
 zi+mDC+zaSDOeOlTZIreW/n1ttkiOgmEvaf58T0EYXo1ta6VDgQM2Dmxe/wfJphkM3PE
 So2fP4dpUT2R7IXpulgQ2nf3LIc6eD28BiqU+zaterVamUunMAW0mzmK7Cg+c4M7BJ27
 /8RA==
X-Gm-Message-State: AOAM533TA/cd2Q8LfrjNDJMeqUJI4mpxw1kj78QHQC7xFIojtqnZbLMv
 58tUi4ZVUV7Q8DIZPhOoCy/1YMDH6whUIf8tSWYHQw==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr139947oth.221.1591194199665;
 Wed, 03 Jun 2020 07:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200603020208.2089-1-fangying1@huawei.com>
 <20200603082600.efes4srlft3xv2tq@kamzik.brq.redhat.com>
In-Reply-To: <20200603082600.efes4srlft3xv2tq@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Jun 2020 15:23:07 +0100
Message-ID: <CAFEAcA-p2rYuU+xG2jtY71VKD8QLLXPuWBa4UJqxRAABsyvNKg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm/cpu: adjust virtual time for arm cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wu.wubin@huawei.com,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0xUX7DgYsMUc

On Wed, 3 Jun 2020 at 09:26, Andrew Jones <drjones@redhat.com> wrote:
> The name 'kvm_arm_add_vcpu_properties' says nothing about being specific
> to the timer. So this is either the wrong place for this function, or the
> function is named wrong. I'd say it's the wrong place, because, as the
> comment above kvm_arm_add_vcpu_properties() implies, the function is
> for all 'kvm-*' prefixed properties, not just timer related ones. It's
> true we don't have any others yet, but we will. I have plans to post
> kvm-steal-time soon, and despite it also having 'time' in its name, it
> shouldn't depend on ARM_FEATURE_GENERIC_TIMER.
>
> How about the below [untested] patch instead?

Your patch is the code arrangement I had in mind, yes.

-- PMM
