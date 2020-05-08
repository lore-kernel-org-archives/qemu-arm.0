Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2674075lfb;
        Thu, 7 May 2020 23:33:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypKSfqqSdiUX5g5WM3KZ8L0HitRyd2eD/5Cx27c71xUb7hAc9jlOBWUyCCVekGH7LtRrzLrP
X-Received: by 2002:a37:b842:: with SMTP id i63mr1235554qkf.42.1588919623802;
        Thu, 07 May 2020 23:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919623; cv=none;
        d=google.com; s=arc-20160816;
        b=UVSUcqWK4GR+aWuFZH9C7xMCJRYv4Zz3b1HJtW8sNhU/wQNqUZF9m1Q/isMaNhY65Q
         dWa+5Ip7IUlEavG9WdJzzclLtT8RTNV5Wrl9gG7Hsnu1jgQQJs+PY6CuDRhCq1TfsUf1
         +JXcnTe9uL5yZGk4FIR+UbhS+d5f4Zlcv6rndkkqmh2ZY2S8ZBL4ywvur6lUFmkl6K5N
         O5Kp6sDetrmhaPrJTuyO8VWVK6+MfT1PDY0YyRXK1yKDovk1yJBr6ecKDO6stYCrdHof
         mDB6jmaXIcl3g/zurW3EekNenX5cNNpxbfstctG8jC4XBQaY+ekvUhIqFXysMWseZqMM
         QDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jwwfqYn37ZuuA2XRfHT8No2IRghgmxoJoLrdND3kOeo=;
        b=0WvtgjN1QBIAyToAhGj2oNuYkbw4QlvP5l12ROWdXkfnYAEspHtXWWZFKSdX88CIfZ
         9jSxdkiiGhX2FJLAYoJ5aYeiTNMwIgH5DwIRDvhyfIxZuvoO+IErskcegHwmLkG0lnEC
         MKwgiUNzT38xOfozW8YrcfI3MEmPB9hgcURKW7lUjPC3BItY2eObPOxInIscdMf2omt2
         GkG0CQL/KCja4mmKYhuvqdjci4uvMfMYvAcvdPy6Dc1FcX63foDViZeg7hq/QmjFaT81
         LcwskSERkS/1PFpVF/xpncTLOr1ZuY8b+c1ybcUL0XurB5S4OR9on4Br/yPiTmobl7bl
         RJZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OY5sd55L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c3si520849qvq.73.2020.05.07.23.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OY5sd55L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwZr-0007lU-9P
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jWwZi-0007kQ-8j
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:33:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27931
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jWwZh-0005Va-DM
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwwfqYn37ZuuA2XRfHT8No2IRghgmxoJoLrdND3kOeo=;
 b=OY5sd55L8+CStaBbHvmVn2J0wbutV8idTNAHOv91tcknSIehYE9WxEtMeqmUd1OPoVjdTb
 4k5KnRf3bAnHlDrqpcJ+kwqRkQx4V3tdB4aNp1kBWx6VKm7Sv6D70Bb9CJS7mGXOyMgmfW
 vtgUKg2n8J5qSwnT4lV+NOs3z4UV49A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-0JVmKCcWOVyGq0ZNeJYtZw-1; Fri, 08 May 2020 02:33:30 -0400
X-MC-Unique: 0JVmKCcWOVyGq0ZNeJYtZw-1
Received: by mail-wr1-f71.google.com with SMTP id a12so412946wrv.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 23:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kINlKotLXZTdgtrcxlOO9cYoJFDWW0LLP3PX1RNmEic=;
 b=Xx5DZijmndrHaFyNOqK84MWes2ub1VRvuR7MZ3Vyv5tO8Az/rco0sr4MJVKG9ghLIM
 LqUji8QEe81CB+IG1jgt8DmV8sMpWXL1RBkn/IIzhT2TLaIptBp73TOsvmXYvpFJ67Xp
 14A/e7SKkj/s5Lo8Dmd/QWG2qMmJfmNzTuP0PKZ7nkKptnVhdAIxNbmXqndtD5jWmPhQ
 8yWdRKDBBX9euTEwmhBemAmX3G4wZ3+k9cp8C58RASLSbt2Yabyov+eS1Fv3mxVKfOk8
 als/6rTLWQ/L95lqALOWijqmJHkTDL92lJH15L9JvSNyUiekqfkobIQM7gZ9uiEmt5gr
 G+ag==
X-Gm-Message-State: AGi0PuZTdGGqldfKlLuP4eFOfc6CRQZl6fqnPHhdjmSWcser3wa8wttm
 Y1dQZFQ/iKcHS5x9lhOwUS025s2EhBnWexP+m3QmDEXNcW8gJt1IO+aGvYIBaSSpQpo81O5jcS5
 kpaeqFQDb4Pv6
X-Received: by 2002:a5d:4704:: with SMTP id y4mr1090910wrq.96.1588919608690;
 Thu, 07 May 2020 23:33:28 -0700 (PDT)
X-Received: by 2002:a5d:4704:: with SMTP id y4mr1090892wrq.96.1588919608463;
 Thu, 07 May 2020 23:33:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:20ea:bae4:47a7:31db?
 ([2001:b07:6468:f312:20ea:bae4:47a7:31db])
 by smtp.gmail.com with ESMTPSA id r2sm1323945wrg.84.2020.05.07.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 23:33:28 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200508062456.23344-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
Date: Fri, 8 May 2020 08:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L7NBCkWzVQed

On 08/05/20 08:24, Philippe Mathieu-Daud=C3=A9 wrote:
> It is not clear if dccvap_writefn() really needs
> memory_region_writeback() or could use memory_region_msync().

Indeed, I don't understand the code and why it matters that
mr->dirty_log_mask is nonzero.

mr->dirty_log_mask tells if dirty tracking has been enabled, not if the
page is dirty.  It would always be true during live migration and when
running on TCG, but otherwise it would always be false.

Beata, can you explain what you had in mind? :)

Paolo

