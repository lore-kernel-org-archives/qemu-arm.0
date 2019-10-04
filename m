Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp371464wrm;
        Fri, 4 Oct 2019 05:23:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCn7fGautfBz7T8d9LQQWEYCYo2ax2SaaGAtHVlRSq8naiIOpjpvKD0SkLhlRE9Kn+Hnar
X-Received: by 2002:a17:906:c7d4:: with SMTP id dc20mr12143266ejb.235.1570191788984;
        Fri, 04 Oct 2019 05:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570191788; cv=none;
        d=google.com; s=arc-20160816;
        b=xAy3S+UR/sGw2PEA4CUIQLjWaKYurYRgYyUhaX8UeLZei70vdFn224NBdsqVh589bH
         MQlYrOFUMCKDo7UbWm0YbRAbqISV7JLEhKsQboBW4nINnc0it93ftdoSMco+GuGP09et
         pkwpfk1vpE3wEdMYkWGg/X9PM5isH3M8D3Na5mKoMbIfLPyHI3MO8n41ZiHi6mXav7ft
         ZjrTQJwhdrjpLFpDBd0Iu1Xf0pfV6+YP6a5f768lp45KoqGv+ORaMZ82u1WsETrLifLx
         fvDcaLDGEo0GIPs6UZpXaP9t+W9hqAJcSe41W2kjYhPhb+Te/8oQVElC5JRgTg5GVKk9
         /tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=SOiPGYJGI/JNSb6E3x3vKGwWs1DLS5EVXD4POQk1UEE=;
        b=OtMADRIYKRj3r5GNI5TYDXPKoazkLAvBkjhi9vDQHZvMd86UYmcoIRyoZ9kfNHSHai
         CaBtCgkWM9532BQdKadR0iMvw7LZpbKCQjBObwrKBZlfSA+sYTq4tkuuwp+eNwZ2BYz2
         2eYH3BkQ4JKMDBhIJ9RAtL1WvbP8Yz2c1wbSMsdwQmlXYIuC9yItJPZExCs2adnNL8JA
         2UxtSU0SBRDmm5a8FYPgP5kdYvQYjqkdmeObT4iM1yYkx1GJU7WT644YpgmqJdf8q/N2
         X8g30i55AfzTEczyPEAfWHac5WRW8grVQvxHOvMk+FnvfcLZnte5bHfq+UcGkhKJuOyP
         XElg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25si3412434edd.350.2019.10.04.05.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 05:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGMbz-0002v1-HY
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 08:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iGMDZ-0004nZ-IH
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iGMDX-0006sD-Kc
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:57:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iGMDX-0006rV-EW
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 07:57:51 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4552A88307
 for <qemu-arm@nongnu.org>; Fri,  4 Oct 2019 11:57:49 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id j7so810938wrx.14
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2019 04:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SOiPGYJGI/JNSb6E3x3vKGwWs1DLS5EVXD4POQk1UEE=;
 b=TkqrqPHX08pdCkV1tq5lFpJ9gOWeyWCd4z7DycxCri0mVlCLIK8vsPz+ecHRfZHaEq
 eNyeT2F6Xj0GAu7ySZS9kqWszlvSNDABdX8WExSkM4Wgy1o9FIf9uP7h1es/CQT9f5SA
 nZAIemzaTVJ6Q53ff7NZ1zi0yrcZESFxuvnN+8TrqxKpU6zpfcK148A5sG/2c1I36doW
 u334k2g2Zl42awOihpXSJAa6ES7VB/qO9AvfTGCqs3hsKORAZaHJMBN9h2FizIqxDzGh
 ym7GL7aS3dEk2qJfQBXnVHSZYeBu0K7Jp4I/DKkYmvKD3e4+UcpfLDxv4UWqKQ4jsqfW
 qdng==
X-Gm-Message-State: APjAAAVHNZRkveJe051bbh/nvKjO8ZMu2DKDmN59wJPEoIXXf4z2IUre
 UJQMnXECCh7UcRnJd/vTNGqa8Z4QGSamHjBHtUpcP9/mspQU3FEwQHKUqKlz4hlV0ZwEhKRhazi
 0M5CJ+gydwwMp
X-Received: by 2002:adf:9068:: with SMTP id h95mr10641429wrh.253.1570190267955; 
 Fri, 04 Oct 2019 04:57:47 -0700 (PDT)
X-Received: by 2002:adf:9068:: with SMTP id h95mr10641418wrh.253.1570190267719; 
 Fri, 04 Oct 2019 04:57:47 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r18sm7032623wme.48.2019.10.04.04.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 04:57:47 -0700 (PDT)
Subject: Re: [RFC 0/4] transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191004114848.16831-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2edcfdab-0682-2728-2632-e4f5bb6cd7e2@redhat.com>
Date: Fri, 4 Oct 2019 13:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004114848.16831-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lumatSVUwDkd

On 04/10/19 13:48, Peter Maydell wrote:
> must be between matched calls to ptimer_transaction_begin() and
> ptimer_transaction_commit().  When ptimer_transaction_commit() is
> called it will evaluate the state of the timer after all the changes
> in the transaction, and call the callback if necessary.

Could ptimer_stop/ptimer_run act as the begin and commit functions?
That is, ptimer_set_* can be called only between ptimer_stop and ptimer_run?

Thanks,

Paolo
