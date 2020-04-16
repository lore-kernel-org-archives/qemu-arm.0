Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1676337lfm;
        Thu, 16 Apr 2020 04:10:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9D+Tskw9cL+EjQe+LeV2sjGe8VYJPFgHFo3ARm8h0dHKvFkzmkWrHaFVxZoyxtYh+ibT9
X-Received: by 2002:ae9:ed04:: with SMTP id c4mr29276877qkg.367.1587035415314;
        Thu, 16 Apr 2020 04:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587035415; cv=none;
        d=google.com; s=arc-20160816;
        b=Mt8am9N04jpiVmEYFaTEncg9mSvjNK+HbAfvQ++zcKEqHIpg7nO0mOC7csDnB9BpTE
         vqR7b7lxZoe5/A13RLIVrt+qFcZT+lb+JNPwQ4nd5cbOLX1S+WBI96e7OURxNqIpwmag
         Vdc5i9NQ9ZfUgcPX/CVMfF+yHZCg4hkDGzbbCrDjQMJ/8+SJ37sS/ollHaT/MIRrI/Mq
         cUGkziVcE5PDcdb2OdVd8WEAu3JF8KQQJbGhfbgM7q/6U6GFmvGgcTaS64poB3fcYtMN
         g8ajnzNAPn1SrtS1VGFYIMbDF0H8wNehQqv4IESD/bI+Mck423WA7M3pcAoY7wqE8oCz
         5v7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wIPDI7c8wyLmq4vVtx2jYxwBWb4ssXaSn4gTWG+NqQQ=;
        b=LJ8rye41KmEvrBq+Zs7sMGCQEBUdasLW8CZLxqxM6KSLB1GGvB3l2eOTHBy093O47G
         JiJFK2md/eFjAkTmlzBuh/DunTb7xOZJR73CGieIGRUpeaiou+nL+5ykwhbc1apon8gt
         dlBPKQh+hOE7EBQv9CcaIu9DAFzgkMbOOtjc9Sb4iAxzLd/2iG57QAxdXzjdcuks95Ay
         ygFd54WcA0EHlv4YVEJCeNWvRh4yDIk9b/1Xg8BkX4hu3Jm9qRTsLvRjG+sGVMNGaWoe
         kD6CnOcXPzfe/jyEgvPhMkQ7FzUC5Ejx4h7rSolUI0zXpyCGYD0fRY3ZLjgUh32OkBW0
         HWug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jDmDLn7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb18si1104934qvb.144.2020.04.16.04.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 04:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jDmDLn7f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP2PO-0002s7-L5
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 07:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jP2PG-0002rq-8w
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:10:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jP2PF-0006DF-1y
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:10:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37039
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jP2PE-0006Cz-VN
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 07:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587035404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIPDI7c8wyLmq4vVtx2jYxwBWb4ssXaSn4gTWG+NqQQ=;
 b=jDmDLn7fc9w9IHVIZBsDb60O+bEyzvifeWf4DOcrNwVs1I4gMuhsALOqs60an/6HUPimDz
 yb/QTqStQFnroj2RSeok+QhbisqYBT2Pijj9bvLojP/ICjYt/GYnlzJAf7zcvTjU1gzEmh
 rJzM2QObbTAnIsl8I0aGSAymQ9eRLLk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-zC4H07e2N7m3-w1CJuj5dw-1; Thu, 16 Apr 2020 07:09:58 -0400
X-MC-Unique: zC4H07e2N7m3-w1CJuj5dw-1
Received: by mail-wr1-f70.google.com with SMTP id d17so1505001wrr.17
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 04:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wIPDI7c8wyLmq4vVtx2jYxwBWb4ssXaSn4gTWG+NqQQ=;
 b=mAgtZbzv9e5HwcLOl+u8ZaZH3EB34ah4Y85R0T9ZUWQNH1o0dxBCntAaE4ePBs7zpO
 DRX38XhRavScXJWqIjF5RtXAdtdRkD4aDZjvJIfYCzVYSdrPvEl4PZYu+j6vJ/0ZrxBh
 WCKOf2b5qLk2Th68afN5My1gV0QNoGCT62NwhKEM4ftnWnEKVR0W2vbxc8K6scI7yton
 8YxW6WVFBGdWv8cnjPvO2E0sqv5GV6rMXNEJ87pqoaqxV94zjXyKOJyeK+FvCoUWfwXr
 LR4D08YhiLU955Pn+nF5BMIkvEaXTuXNVrRZBnSNdC5F786sOf+X4t1ovEV1u7f/9Y0U
 IiLg==
X-Gm-Message-State: AGi0PubPvfHiL3MY1Oq6rZ3BSOPI02USsnrwaSSuFYunxvRGAsD0iss/
 raR/Orx2CQQQ3Jwjmd46uEpJXCsnFMYUkEADTjxgoqYkRHusWufbjFVBUynFDFAzf5V+zjEmUIl
 W9HowjO4LDaIA
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr4289271wmg.50.1587035397329; 
 Thu, 16 Apr 2020 04:09:57 -0700 (PDT)
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr4289234wmg.50.1587035397039; 
 Thu, 16 Apr 2020 04:09:57 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id p3sm9144941wrx.82.2020.04.16.04.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 04:09:56 -0700 (PDT)
Subject: Re: [PATCH] Cadence: gem: fix wraparound in 64bit descriptors
To: qemu-devel@nongnu.org, rfried.dev@gmail.com
References: <158702996540.15335.16514068999380777664@39012742ff91>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71dd512d-485c-d395-df90-f6208f91c655@redhat.com>
Date: Thu, 16 Apr 2020 13:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158702996540.15335.16514068999380777664@39012742ff91>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, Juan Quintela <quintela@redhat.com>,
 jasowang@redhat.com, alistair@alistair23.me,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QWL8Oj+QgnA

On 4/16/20 11:39 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200416090247.353414-1-rfried.dev@gmail.com/
> 
[...]
> ERROR:/tmp/qemu-test/src/tests/qtest/migration-test.c:1229:test_migrate_auto_converge: 'got_stop' should be FALSE
> ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/qtest/migration-test.c:1229:test_migrate_auto_converge: 'got_stop' should be FALSE
> make: *** [/tmp/qemu-test/src/tests/Makefile.include:636: check-qtest-x86_64] Error 1

Doesn't seem related to the patch content...

