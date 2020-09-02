Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp444830lfc;
        Wed, 2 Sep 2020 04:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZZJvN+MGENs9jPvhTMzsUmgO1WtilK9z6TfCjIz74slUhZAYPg7ltWASiIvxX/PtYof49
X-Received: by 2002:a5b:990:: with SMTP id c16mr2758271ybq.303.1599046063427;
        Wed, 02 Sep 2020 04:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599046063; cv=none;
        d=google.com; s=arc-20160816;
        b=mgav+uzNRwFISvu4Y5Wn6vKvTzZ7rHhEDnXVNULTOvWD8L9ootI5U88P+zE0ao0Tt0
         9qnRgXD3fWtgsYtkaWRVRq9gYfNgPqIdEaGa4/116yqHTsrrjnf43P4p8netYiG31bR3
         k7VXYedrk/GCrDmrUSXRKTdLJrQigjSRA0aGO//uJNpvNdE8I4lUth5DCJ08FSZsIS9L
         Nsx8VO7Wlg+zsOKvRsE3emwfk7CMsAR1wmOwKRBnhZGcpHUv6DwSD74dXNyvBLL4Ll7k
         SjXt2+/RsVm/U/ZzdJWeCw0wl33r2SpMb2x2n2gCYo2h3OFtHHu7Ly7C/PKte7TyTznU
         kTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iSlNuonYnoNMgoUiv8t7hA4TF4jW7s2LNuA0HJWgNwU=;
        b=hdbybabcwyCNhvNMrwHteRNmHf+y9juwZVJ/9WAW7NTrJiQ9d9IJknAFUynedTWS8n
         lzAE1BJpEgTkY7VtFVQGproG/XgVGPMe4Y/lrXkIFoT/58EFY+Ew5wOMgF7WyU+PzJSi
         dEGnNv1vn0DUsLVr164pVILdzVO46j7kbHuhAlGJzmLlyh9MvWJ+svtRzjF3MZJQB8xV
         CvMXyT3cTVMneUtYulq43uENXEKKIu4QvTQvuX5LL0h6GyOMMaY4kk9ZMjFrTofRnNfR
         k09rVwG4dsO9XfHiVWouqyzjChzSclIwPhv649VSiHIx+s3JoSM9t9P/1E8QEOLJ/iKh
         dBRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="g1vutA/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r197si4534522ybc.430.2020.09.02.04.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 04:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="g1vutA/F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDQvW-0007y5-S4
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 07:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDQvO-0007vl-C9
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 07:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDQvL-0003jJ-Qa
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 07:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599046050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iSlNuonYnoNMgoUiv8t7hA4TF4jW7s2LNuA0HJWgNwU=;
 b=g1vutA/F/k1QD77JP7FtyWAo/K7ynlB1+9kzYsD40lU4N3kqtvGSNRiusJAbYQWYso9hkd
 kdLPxW1/Umt7KFNbq0SHyzcGBNTP2qx/gu1VIOkWpYkkrpw/zUaR4YfNFSCzESd0Ws3efj
 Ed/7HetgvMw7UzkmhRnq0AmGV1w1GtM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-ppk999k-N8KGJa2Rf1E-vw-1; Wed, 02 Sep 2020 07:27:28 -0400
X-MC-Unique: ppk999k-N8KGJa2Rf1E-vw-1
Received: by mail-wm1-f72.google.com with SMTP id w3so1782171wmg.4
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 04:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iSlNuonYnoNMgoUiv8t7hA4TF4jW7s2LNuA0HJWgNwU=;
 b=KEp7viWv1xM4hu/PeyVW6bsKYq5cM8wIxsxCsHQ6zqUeYmRQpb/2E520bjftKX2XfP
 xHTYbmnhmltxS2oi1EsnsMxU9HvDrx4lk5sDbFJr6T9jxaXUWUJRwSpA7EF4ooTa3Heo
 zJb9Ao8obCHqnrq0TKmp9JL6+2gILXDYaiSyHuhKYzpY5+GontXZia4tuKN4/37aVaZQ
 UhQ0ZCL1lBALMhAe1SuhRE/92DZgLPUGQSOZEt91ALayX/jgGQtpF0cUHq683E2bixEK
 KaLnlb6tXemf03/zbTFBaynQ/cBl6xydUKUnWWxlw5gXiYzNdA7VgvFw01zeC/PGITU5
 ObaQ==
X-Gm-Message-State: AOAM532wcDDH8o4bQ4HXErO/U0nHaXxsmpnk22Wc4S8sgrXaPzilIKZr
 KMz553x8y53Y5gsv/Zbb9DaYBcjbdt2aqTb+dL9XeEXMWGVISon1cc1WC1Q12Ehngq/rJHJOUnV
 ECcbP55csmD3F
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr213310wmj.64.1599046047045; 
 Wed, 02 Sep 2020 04:27:27 -0700 (PDT)
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr213287wmj.64.1599046046703; 
 Wed, 02 Sep 2020 04:27:26 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.173.193])
 by smtp.gmail.com with ESMTPSA id g18sm7220577wru.27.2020.09.02.04.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 04:27:26 -0700 (PDT)
Subject: Re: Cirrus CI for msys2 are working now, but still buiding failed
To: Thomas Huth <thuth@redhat.com>, luoyonggang@gmail.com,
 qemu-level <qemu-devel@nongnu.org>
References: <CAE2XoE_SkH-2dNULFAZNiRNRNP=OncwCy=xrDk0J3bzS1Th=tg@mail.gmail.com>
 <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bbd3bdff-5326-bdad-7389-c862a4e9edc0@redhat.com>
Date: Wed, 2 Sep 2020 13:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c61f6420-ffdb-b2b1-44ec-60b8a55f9c8a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 01:13:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M5soxkS0mOHR

On 02/09/20 12:38, Thomas Huth wrote:
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> C:/tools/msys64/mingw64/bin/../lib/gcc/x86_64-w64-mingw32/10.2.0/../../../../x86_64-w64-mingw32/bin/ld.exe: cannot find -lfdt
>> collect2.exe: error: ld returned 1 exit status
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:2184: qemu-system-armw.exe] Error 1
>> make: *** [Makefile.ninja:2182: qemu-system-arm.exe] Error 1
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:1875: qemu-system-aarch64.exe] Error 1
>> collect2.exe: error: ld returned 1 exit status
>> make: *** [Makefile.ninja:1877: qemu-system-aarch64w.exe] Error 1
> Wow, that looks quite promising already! But I wonder why the build
> system is trying to link libfdt to targets like qemu-system-avr that do
> not need it?
> And for the targets that need fdt, it should use the dtc submodule... I
> can see in the log that the dtc submodule is checked out, but it does
> not seem to be compiled ? As a test, could you please try to run
> "configure" with "--disable-fdt" there?

This is preexisting, lots of libraries are wedded blindly to QEMU_CFLAGS
and LIBS.  It can be fixed once tests are converted to Meson.

Paolo

