Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4815089lfp;
        Tue, 11 Feb 2020 00:12:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzEA7lZPn62ng64cLYRPiplLIV6pv6Zv01IUcgiaq4lkq5ClvIZCOlFXAXnBnSfybZd23js
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr14315325qvz.138.1581408748168;
        Tue, 11 Feb 2020 00:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581408748; cv=none;
        d=google.com; s=arc-20160816;
        b=MVfO6ZPl3MrafusQDgWaPRACzFCmKWG12mA00V9z4nUAmJamPyWmcl9LbUVHnjV0bd
         ipHXF5TxkWN56pBCqZmaKs1VVgI3uDDQOoIJhVsuXWEHSl5V4Dw1ov5Bes5Nplcqr7Cb
         ua4GYMswlF1TJQQPYmIXwxN9bRw3/IYiMa+zCg9b4QH6ZxBGiF2qInOYZtKCPbPRnwny
         O4z14DGNnaoGVxp9lUx5JG/t+VOKemzydVKYm03H29eTbvaYbJzOx5cN+F+JjOsGa2cn
         3eIR9pLStU5Mk37s/Q8XZIq+hO+Ab/RuxaZLmbI6hAbpfNzK7FeyH/VArWSgtrXpg7gx
         8gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=f56l6U6vjy7cpXRZWOQ7FR84keLCfNAvmcdGuBRGedU=;
        b=Cey2+musQMczeLBqiz9O0d6R5VdzdkbczbhlDM6Fe+EC88Tx1gNpRLLEOdZq9caWSB
         RYcWjzG/PUs/LdhX9gr+kJk7MuKPtNbSuFLQDX07g8ayAA33kCgX8d0Ax6DPF9qKCjHA
         XXXPZC0HT7jmgTh+Dp5zgVW7tzFxw6RIWhueqVj2+EOrjKil3EvKOl1/KxgIGctK9LYC
         D/w4Cv/KxrCYRaubQQoFSKMtxE/ml5PNcS1yqSdJZ5LYPoBaezi0odgoFrkkfF7GikNw
         442Ms/UTyzmyghel4o06IsUXVQb3MgYH7wDZygcd9LKPf3PCm0Y5IeT0CmShE6m7cxgE
         lrmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MaZx4tfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si40846qkj.74.2020.02.11.00.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 00:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MaZx4tfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1Qeh-0005xk-JY
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 03:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1QeZ-0005x1-SE
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:12:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1QeY-0002Yo-Ow
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:12:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26222
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1QeY-0002Yf-Lt
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 03:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581408738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f56l6U6vjy7cpXRZWOQ7FR84keLCfNAvmcdGuBRGedU=;
 b=MaZx4tfM80ztFEML56naBsPxLwcuCAKZRX7hK8YjNSME7/c55YydW/smXS/vWlC+F6egEH
 l8n+NgfBtWUEuGFCqsHAgHFeB3EkJoI+Gnn+PebRf733o4I5ZqGLSnJk8rrtESZGPwWICd
 OxSR3Fa9G8tsaX6MdqX749lu6ZepLR0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-e0xjUhTDOoiAAwBZTo-rew-1; Tue, 11 Feb 2020 03:12:10 -0500
Received: by mail-wm1-f72.google.com with SMTP id p2so728616wma.3
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 00:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f56l6U6vjy7cpXRZWOQ7FR84keLCfNAvmcdGuBRGedU=;
 b=L920kRE7tcyVsm9e1qhV4Aqd7vFjFoSYJluRTuAidnEHDXWUJKPEsLFGfA6wHMbrwl
 6PwpvwGGxn6K5H752d3CuMG34nkdsDhLDx2t1xz3MpZkW0630dDsJINGGf8V8t7DijY4
 ij6ReQnoo1k4fnt6QH4lIbrnT6nmhrYZzqUZ4tZxUEFgRcAzxKPxx0d5CTR4UwXVNS6y
 EH6EqDY2JODPHH1ysvxksPXsb55n0bt19hogyOnhcPdNgzOuFAP061lcKUYUhr861p8Y
 L++ZpN8n7T+uQRDYkXYNHTIVMhqzX5Gf5rR4dD8wqGWcY2V3yWGitOiPxuKOWa0ztSTi
 Lkpw==
X-Gm-Message-State: APjAAAW3A9ViNjpP1I+UJPdKlAUXMdFkRnsKik6/DDqfL2nFCGZMwLCd
 biiJfT7jrpVVkTNL5j62qdh+9Uv0Oe2Dge+y7NosRGLA32HZ6zYKtYXkhbvlbWLAJsE2O1pGcNW
 y55Mxj57m/yBn
X-Received: by 2002:a1c:960c:: with SMTP id y12mr4106284wmd.9.1581408729812;
 Tue, 11 Feb 2020 00:12:09 -0800 (PST)
X-Received: by 2002:a1c:960c:: with SMTP id y12mr4106259wmd.9.1581408729504;
 Tue, 11 Feb 2020 00:12:09 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id c4sm2646791wml.7.2020.02.11.00.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 00:12:08 -0800 (PST)
Subject: Re: [PATCH v2] hw/arm: ast2600: Wire up EHCI controllers
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
References: <20200207174548.9087-1-linux@roeck-us.net>
 <158111304888.591.9861885311267533100@a1bbccc8075a>
 <20200207224850.GA10890@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <445cee18-5de3-3da4-fef4-2e3f4530d96b@redhat.com>
Date: Tue, 11 Feb 2020 09:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207224850.GA10890@roeck-us.net>
Content-Language: en-US
X-MC-Unique: e0xjUhTDOoiAAwBZTo-rew-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kK42fK6DE8HQ

On 2/7/20 11:48 PM, Guenter Roeck wrote:
> On Fri, Feb 07, 2020 at 02:04:09PM -0800, no-reply@patchew.org wrote:
>> Patchew URL: https://patchew.org/QEMU/20200207174548.9087-1-linux@roeck-us.net/
>>
>>
>>
>> Hi,
>>
>> This series failed the docker-mingw@fedora build test. Please find the testing commands and
>> their output below. If you have Docker installed, you can probably reproduce it
>> locally.
>>
> I forgot to mention that the patch depends on the similar
> patch for ast2400/ast2500. Sorry for that. Not sure though how
> to tell that to the test build system.

You mean the "Aspeed: machine extensions and fixes" series?

Use the 'based-on' tag with the series cover message-id in your cover/patch:

Based-on: <20190904070506.1052-1-clg@kaod.org>

