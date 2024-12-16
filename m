Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2435501njb;
        Mon, 16 Dec 2024 11:27:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW775IYfFQ+q2lqNKw90go4TJzhwbG3lE+eJwe3//tXH46PPKYO2bEyrf6xKm6QC0LWyKyyrp3k1eghTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFgBDh4uyre88WnHfKcxEZqO0SYC6Q38QFBSUc6UYDOVCxc16TRjopnDlhsow/G9oI6ofPp
X-Received: by 2002:a05:6214:19ee:b0:6d8:aba8:8393 with SMTP id 6a1803df08f44-6dc96996002mr254697366d6.44.1734377269882;
        Mon, 16 Dec 2024 11:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734377269; cv=none;
        d=google.com; s=arc-20240605;
        b=PMaBxLGgE5UWgqcfueLjX+xrwkzwRYjUdrhiBpzi3uPf7RXBYJZzLO81AkGdQcrUqL
         d+HpqjN4Nhol7ELSjgMwJqrAUdIDHeczu4Ucz0ANMCyXPhuDpiXuPcNMt0HUDuAoFVx8
         rY97MkpB8R+RFRrgXQs28wGDm3sJWnDEDFtNM4LgeNnhjJrMQNBmJUM/qAeqev962k/i
         lVhYXR/VeUcXQ7Az1UewWjLb/qBjtbjZqRJylW6Ek+LXdtmF907bsZZbyNxOo8HGKVG7
         B79aH/E5Yo9C/hODBhxyEM3b55Wor9TcEMkH/jY6umecLdPyjIoIeed9YPB2lGW7achB
         IQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kt2ekZ+m6agASaky/ZkTIEt1cQqO9LQiurCTfFqV0XU=;
        fh=ePI4ijJe8VJv7AR9zV1e09PtqgoCsixtShmgJNIoBm8=;
        b=dTtfFIYmOydHMnnfLVhjHhZTHjE2YKvJusBADE0r97rpWejdKvYBb+36USBNRguu8e
         /t1xr0fHJC8z10yCCVRx/ZohUagC0zRsIlES5Y3icm72I+F8iLVBxjqfi2DvKM+CFYCQ
         YGKQ6gyMq4qIKsttW+XB9NSMOrAzcLvKIUCgRRAqv2lX7o/VxHMtmtkooj3rd2P0QyT1
         zFkTwnDQ0enR3lz+Q34wxzJodunTK3X5x92aWcAXpJe88PHOuTDlSxRyj0qDOlbmfxYj
         e438AFoz6jF+JU3WBQite45SlnLtfNmuJTRHMWj5LypNmZNZDkDzTT3tC+ot6aqJ8PCO
         aCjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zYbyONKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dccd373735si78618866d6.328.2024.12.16.11.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 11:27:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zYbyONKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNGkX-0006IB-Pp; Mon, 16 Dec 2024 14:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1tNGkN-00067I-9d
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 14:27:19 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1tNGkK-0004ti-J4
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 14:27:15 -0500
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a7dfcd40fcso15045ab.1
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1734377230; x=1734982030; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kt2ekZ+m6agASaky/ZkTIEt1cQqO9LQiurCTfFqV0XU=;
 b=zYbyONKc82q5JbpxQTyBGrr3qkKpsasXJJGhnTTIPLfG6crq3JC1kY4pxIPc5Q5OJy
 0KcmpBUCYk2VWj1inebFXbZfydg3CFHlKDzGqJ1R3OXCrnlwUgxhsiYPhAmOmCTX6C5A
 iUXa6y6k4gcY8XUBL+1WzcorMt2FiMOoJBJAv2PAbECpGUqTIw47twcknSJ2JIzYMfTV
 tJqHRf1mEBhJ+RWamkHyaRaI0VnocJd1/CNH+QZEviV7y6a1T/+JdVcsQYvMQ0PJJHY0
 y3D3vassQzwR8DqeolJy5HvHmFr7mYQ6gD6gP6rLZz4DGN1HfgJln76wreBuiWT4XoRB
 Lfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734377230; x=1734982030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kt2ekZ+m6agASaky/ZkTIEt1cQqO9LQiurCTfFqV0XU=;
 b=d+rSbCUHr80NcNsz6yMPevWeKzQzX5aZwtHhMtR7DesMVBkO5/Grp5PfLJC3vk6cNb
 hmqfzzToGu3QBOjUWrOMQ3yiYBqkoBJwn3dIUe2LMm+Q9Vefd5EtHgJlQ2JTjK8vxIWC
 Xi8ukvOvNCYsmaP7cHuEfRtlZIa11FrAz62POsagPlEGnmDnGAB+Ad44zVPnVwsjkmRc
 RiCmYjEyYbs+r/OZmRBpBNqVYblSPCxaBzHL3Pl19iprYIHHEWV3Fp84n/vYqZTbYiif
 U1V9N1C9OceQ49MxsUheMboQZNlvDVekIWPwX1a2TTQpZeyb8AuWpiFsZV/phmrUDtYP
 lBCA==
X-Gm-Message-State: AOJu0YwI428jC2cuuw2+LrPSqcRuF+sKwOXpQpy5Ot+be6ARPJWmGN+J
 v/5v18dl7mum84CCPUMtgg6lxvpLNkxiLYt+Iwh8wNaZ9UjxUVyLFMSqhj/NMwuHbtjLLx/JIeJ
 SEDaqQh26yxAw0mySIGMaRjq3WFZgOHdD5H32
X-Gm-Gg: ASbGnctxBGPCToz1DR7/5VMqjK5FYO95Ff6e3KA8GqlReOFMG4SqksUc10/PSuXOp9U
 y0QZ5kUKGCM2/tKt/dw2ouzGtJIUj/gzYBj9TQMeBGtiYvMuGmy8HqRS8FRX/TQQAndVE
X-Received: by 2002:a05:6e02:1ca4:b0:3a7:a468:69df with SMTP id
 e9e14a558f8ab-3bb3ebed447mr69075ab.3.1734377230499; Mon, 16 Dec 2024 11:27:10
 -0800 (PST)
MIME-Version: 1.0
References: <20241213224020.2982578-1-nabihestefan@google.com>
 <CAFEAcA_MR86C5+jV9=uQsZZ905w7+OgHozfQZKYXx+=Xdv_xqw@mail.gmail.com>
In-Reply-To: <CAFEAcA_MR86C5+jV9=uQsZZ905w7+OgHozfQZKYXx+=Xdv_xqw@mail.gmail.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 16 Dec 2024 11:26:59 -0800
Message-ID: <CA+QoejWYCMYRnrO9JnN9pEiJt0gLDUu8g5kkVenzp+xJeJp8Qg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de, 
 lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=nabihestefan@google.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zemArBSPQP3X

Actually after some more debugging with the help of Roque (cc'd) we
realized that this patch doesn't actually fix the issue, it only hides
it behind the watchdog.

The root issue comes from
https://lists.gnu.org/archive/html/qemu-s390x/2024-09/msg00264.html.
The function `qemu_clock_advance_virtual_time` is broken with that
patch and the conditions of the sse-timer test. In the test (and other
tests) we run `clock_step_ticks()`. This function calls
`qemu_clock_advance_virtual_time` which now has a check with
`qemu_clock_deadline_ns_all`. This returns -1 if there is no timer
enabled, making it so the virtual time in this test is never updated,
thus leading to the failure. This was surfaced by the INTEN fix in the
watchdog because now we don't have that timer running free out of
reset. Once we enable the watchdog timer, we make it so
`qemu_clock_deadline_ns_all` will return anything but -1, letting us
continue through the test. My theory is that in other people's local
builds (as in one of our local cases) there is another timer being
activated (which in our case was the slirp timer) allowing the test to
get through this failure. This patch only covers the bug, not actually
fixing it. We shouldn't actually merge this, we should instead fix
https://lists.gnu.org/archive/html/qemu-s390x/2024-09/msg00264.html.


- Nabih

On Mon, Dec 16, 2024 at 5:40=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Fri, 13 Dec 2024 at 22:40, Nabih Estefan <nabihestefan@google.com> wro=
te:
> >
> > V2: Removed scripts/meson-buildoptions.sh.tmp Extra file that slipped
> > through the cracks and shouldn't be in this patch
> >
> > Recent CDMSK Watchdog changes (eff9dc5660fad3a610171c56a5ec3fada245e519=
)
> > updated the CDMSK APB Watchdog to not free run out of reset. That led t=
o
> > this test failing since it never triggers the watchdog to start running=
.
> > No watchdog running means that the timer and counter in the test cannot
> > start, leading to failures in the assert statements throughout the test=
.
> > Adding a reset and enable of the watchdog to the reset function solves
> > this problem by enabling the watchdog and thus letting the timer and
> > counter run as expected
>
> I don't understand this. The watchdog on this board is not
> an input to the timer/counter, so whether the watchdog is
> running or not should not affect whether the timer and
> counter can run. Something else must be going wrong.
>
> > Also renaming the reset_counter_and_timer function since it now also
> > affects the watchdog.
> >
> > To reproduce the failure at HEAD:
> > ./configure --target-list=3Darm-softmmu
> > make -j check-report-qtest-arm.junit.xml
>
> This does not fail for me, and nor does running just the
> single test case in a loop. (Tested on ubuntu 22.04 with
> gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0.)
>
> thanks
> -- PMM
