Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2427338lfg;
        Mon, 1 Aug 2022 04:21:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ueFhGBQuho/aSjRWF2XJoboGBIlgqvQmWNsooy/b+YPPv3p+OPXJkY8nw31P5vF/MRnYi3
X-Received: by 2002:ac8:5c4e:0:b0:31e:f6e6:c62 with SMTP id j14-20020ac85c4e000000b0031ef6e60c62mr14145935qtj.460.1659352877217;
        Mon, 01 Aug 2022 04:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659352877; cv=none;
        d=google.com; s=arc-20160816;
        b=bYTaCOv30AQjtMDN0TQ8wihippZxWOZnyCY9Z3mFSUWfqv4vkNur3lqgZ57q382q/E
         qVKOEtQuncSWfITpkOZFs4rGNs0hZYyn5OJIaLli4UrWNojlt6zzwl6eq72VKnHqWoo5
         3tdOJl8uXepOkBlBntfJbJVs0aTYvxL9nB/yzTwe2RIRnGvVIjMRn6KuBNAuxFwVo50Z
         Cz1SLxzfc1MEH3qJhCkXv+e0dzgPfhtQ/kQhGNdqzf6ixDAnqYm/VtzlQvY8QflT5bmm
         5gd8TiUSH91N7h1F76SehHphUMoLC0h8DglQmgkKY1zTtnEVmPKMUW5ZsUu9EyXYGI5I
         6RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gmt6LtA/nwGnB8J/Ffl0WACr25McveDQYoFW5UmbV1M=;
        b=u7vljVHRGX2JnJCF/tPA5HL7BOQd2bKUmj/hibWsNC6B4qNeeWYVoFFN0RdhESdW8K
         oV4CR7dxeNoR/loGTKRrPSCTeBw9te0PWGeG+qbEXVvg2a7W74ywc7XghkDFO44cxgP1
         YH8+jhQ/dEBw0vKPcll7prC19geSqyGDgHG9fxK02dNi7nCT6YKG59dSdvvJrYTrcSse
         OwylsqvANIpw2QSuDYMm0tEPEfL5+9M1vyem2dpXbyIwwJExWVLWKuRmydv5nqSxNWJr
         CuOw3W6kj8JZoFwq7UDUJV9pNswq8Zh5ec9AXfz36s9rtybOAu7mdRKhR3oEdPCXwXkY
         kq2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8Q9uWja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv17-20020a05620a1b9100b006b568c07ae9si7259799qkb.143.2022.08.01.04.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 04:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D8Q9uWja;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oITU4-0008Ck-O6
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 07:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITTR-0008CI-2J
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:20:37 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITTJ-0004Ne-Bi
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:20:35 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31f443e276fso105602507b3.1
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 04:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=gmt6LtA/nwGnB8J/Ffl0WACr25McveDQYoFW5UmbV1M=;
 b=D8Q9uWjaRLtWoCACwbPqrmWVT7giijyNk27JcZjldV9/8bwpmxgKUBrXXhrhGCk607
 IznJ0qwT34wD5bMLBtKMe3bEKn3Jw8q9GBqla4Un1aneF/yNPYI2Zu9i80Vh5UQI85ro
 yuuYHGwYEJRk+1QLbT845ikX6C1pBhdIfjg2az7ZWmrnhG+WwpMy06s7tRJ4bHaQFzgb
 0xOemn5qAhGwp4t5DJhKgqsoltPmsFQo8+2otCN4CF/Us2IjHuOoqgk1V/dwTurUGMwW
 JStwA6SXlSd6OZtQrUiN0PVPS+U1MbFJ3z/wTNV6u7nmVKGE3z3nZzTI1qq+3QcpQPm2
 VviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=gmt6LtA/nwGnB8J/Ffl0WACr25McveDQYoFW5UmbV1M=;
 b=HWCaCkT17l4gQmlkEVvVXs3C4gVpEiHN1CYO4YIcHO35cqLZCiMqEVP9P5MAM0Ur6H
 YYwIwh5CW2mH7S1Xt6W+K0Su+1TsQrNIb6b4Hkyw+E3PFAdgdMv2fGX8UMJIEkgylDgT
 26LGvhazFjznkY0eLI2tRGllzPshNfQKlxV5X21frMmqep2KGyQKFccq7U7j5uq9V+/x
 hFUlA3OLbUZfD9WQmfE47/HzNZSCn69+S3uXupI4X9xJdpMT7TZ+qkPyHnHRXzWT6zfj
 UNtHswrZqZVkHOOo7UEBq5A6//S6VFpqaYJcsSjcjMZhHybLNsjumATYRbIPrA+BRpSD
 06DA==
X-Gm-Message-State: ACgBeo2E6NQdHiTZ5yhJPL+q7zaqEhbcaW9RbX+3TDI4Qn1XU5LGWXjK
 Gb32eGc0dCltXsnDVjdk16VRROSN6QegTD6Mnq2wwg==
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr12437670ywd.347.1659352828194; Mon, 01
 Aug 2022 04:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-9-dgilbert@redhat.com>
 <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
In-Reply-To: <c4ad47a1-a946-0f4e-69a2-65a6cc679a6e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:20:16 +0100
Message-ID: <CAFEAcA-jET2fWX0C5uCW3q5_-SRpsCpM3mGJUQTH-Bj5LY0+8A@mail.gmail.com>
Subject: Re: migration test fails for aarch64 target (was: Re: [PULL 08/30]
 tests: Add dirty page rate limit test)
To: Thomas Huth <thuth@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 leobras@redhat.com, 
 quintela@redhat.com, berrange@redhat.com, peterx@redhat.com, 
 iii@linux.ibm.com, huangy81@chinatelecom.cn, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vhF1yQ/2Mvcd

On Mon, 1 Aug 2022 at 11:41, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/07/2022 13.19, Dr. David Alan Gilbert (git) wrote:
> > From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> >
> > Add dirty page rate limit test if kernel support dirty ring,
> >
> > The following qmp commands are covered by this test case:
> > "calc-dirty-rate", "query-dirty-rate", "set-vcpu-dirty-limit",
> > "cancel-vcpu-dirty-limit" and "query-vcpu-dirty-limit".

> This assert triggers on my x86 laptop when I run "make check" there. More
> precisely, it triggers when qemu-system-aarch64 is getting tested:
>
> $ QTEST_QEMU_BINARY=3D./qemu-system-aarch64 tests/qtest/migration-test
> /aarch64/migration/bad_dest: OK
> /aarch64/migration/fd_proto: OK
> /aarch64/migration/validate_uuid: OK
> /aarch64/migration/validate_uuid_error: OK
> /aarch64/migration/validate_uuid_src_not_set: OK
> /aarch64/migration/validate_uuid_dst_not_set: OK
> /aarch64/migration/auto_converge: OK
> /aarch64/migration/dirty_ring: OK
> /aarch64/migration/vcpu_dirty_limit: migration-test:
> ../../devel/qemu/tests/qtest/migration-test.c:2304: dirtylimit_start_vm:
> Assertion `(strcmp(arch, "x86_64") =3D=3D 0)' failed.
> Aborted (core dumped)
>
> >   static bool kvm_dirty_ring_supported(void)
> >   {
> >   #if defined(__linux__) && defined(HOST_X86_64)
> > @@ -2204,6 +2458,8 @@ int main(int argc, char **argv)
> >       if (kvm_dirty_ring_supported()) {
> >           qtest_add_func("/migration/dirty_ring",
> >                          test_precopy_unix_dirty_ring);
> > +        qtest_add_func("/migration/vcpu_dirty_limit",
> > +                       test_vcpu_dirty_limit);
> >       }
>
> kvm_dirty_ring_supported() returns "true" if the KVM of the *host* is x86
> and has the dirty ring support, but it does *not* check the target
> architecture that is currently tested, so you also get here "true" for
> qemu-system-aarch64 being tested on a x86 host... Thus I guess
> kvm_dirty_ring_supported() needs also a check for the right target archit=
ecture?

Presumably it should be checking qtest_has_accel("kvm") -- even
if you're on an x86 host and with an x86 guest, if you're using
TCG you're not going to get KVM dirty ring support...

thanks
-- PMM
