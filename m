Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2585261lfy;
        Mon, 24 Aug 2020 07:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIBmbhmlNOAM5APpzq5YPO4LwJ6r+mWMHDnN4644gX1/Rgm4UvRBQPLu4wgVgwSlyKCP3h
X-Received: by 2002:a25:c743:: with SMTP id w64mr7342804ybe.127.1598277824551;
        Mon, 24 Aug 2020 07:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598277824; cv=none;
        d=google.com; s=arc-20160816;
        b=gdpuVruEeQgYCIpdeRdR2W4G/8M5clcj+6w9RznVu1Ts82pUvjNPbTxq1KOCic6EfW
         t2w7Xnpz4bSgyrURhqPWGHRVDGVYE7OF6pXyIpSu83dmIZiYVpFY1jlEP87sRBnKPW3Y
         7GmXfXwWl9e5V/q8gx7ShMcRK3Ypwv9gQbDj1MmKCTfwvYUU3MehM2QgKESvlehnszRE
         C1ZRRM/qhCK/ezXYCo355BHOfVVMBS5UvbOyljveH9gYaSRgqo009TC2FVHoVmUzrNQQ
         aC3e6dOshIeLkGpf3eKBDTUtJr5Ml7iQoze0x+pHwTDHjKM4CKhVXMF6XP3WwIomS0Zo
         ztkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QoxDH9u+RgG7BGcQvnvLITJtpgz5weaOrynUm3g9tp0=;
        b=0AxkEMqDwLYzJtHkSkBkmi+GTt05UBJJpLAtaa3R6xjNtlrVyOiBkpCgr/asykXhMP
         fJ67Hs7W6mEq4L+X8/VqH3xYLnc3uzrfq0l/pa3VZR9paPWrnsYHScSPrn58fHKIGdC+
         Nwm+CWo/9mlLdJW4qwTTijPNZ6xDO5o/Bl2lf5IJBA6dQUG+5SJbaGMkIAo4SHJ3OkO5
         D3QMqNp+RW/I0m7rEFFCtG46bHTMSQBzx0vTy1agWN4Jf7gcwq71UpIdFEn+TjSXMEOW
         LOQd0wCczJvoPMaptho2GLM2bjJCsN2DNFAQLYvhmkRpa73K2skY+hzMMYrtzyAro/iU
         Gkrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvdhS0l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v200si11047466ybe.91.2020.08.24.07.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MvdhS0l2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAD4Z-00026Z-S1
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAD4S-00026C-96
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:03:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49316
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kAD4P-0007M0-KS
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598277812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoxDH9u+RgG7BGcQvnvLITJtpgz5weaOrynUm3g9tp0=;
 b=MvdhS0l2fvpkD3j+/h46XUgaW5HehFY2/bw7Ny09tpbbb278qqgwktrRoJeDSNBcZqvweD
 2W5hjxonItNgn/efm38bo7F0SFRMybL5kKn7JDH5m0+hfy6dLtmo4cfOHdIonuHQGEO9qX
 o49X0jStFM28ZESP/dHNMhJiqG2/bA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-bAwIzM8LMvWCZby6rvHbdA-1; Mon, 24 Aug 2020 10:03:14 -0400
X-MC-Unique: bAwIzM8LMvWCZby6rvHbdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5F59100746D;
 Mon, 24 Aug 2020 14:03:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-8.ams2.redhat.com [10.36.114.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CD41055A41;
 Mon, 24 Aug 2020 14:03:12 +0000 (UTC)
Subject: Re: [PATCH] disas/libvixl: Fix fall-through annotation for GCC >= 7
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200824130114.41368-1-thuth@redhat.com>
 <CAFEAcA97pa2eUx2-c-YmuBGaVA9jUDZ-VTd5fCpcyJ1rigiEww@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d9cd17bc-76da-89e1-d455-72d688e21cc7@redhat.com>
Date: Mon, 24 Aug 2020 16:03:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97pa2eUx2-c-YmuBGaVA9jUDZ-VTd5fCpcyJ1rigiEww@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 06:40:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.25, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qFIJUPwnLd5d

On 24/08/2020 15.18, Peter Maydell wrote:
> On Mon, 24 Aug 2020 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>>
>> For compiling with -Wimplicit-fallthrough we need to fix the
>> fallthrough annotations in the libvixl code. This is based on
>> the following upstream vixl commit by Martyn Capewell:
>>
>>   https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337
>>
>>   "GCC 7 enables switch/case fallthrough checking, but this fails in
>>    VIXL, because the annotation we use is Clang specific.
>>
>>    Also, fix a missing annotation in the disassembler."
> 
> Maybe I should just update us to a newer upstream vixl...

That would certainly be nice, too.

  Thomas

