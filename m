Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4083905lfa;
        Mon, 2 Nov 2020 08:51:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgfHMeR892F48fpMWgdCh+FLjLjN2LVBn6G1shBzwsvxsmztHu2fv1FBIN9CKSkcQ41Kk+
X-Received: by 2002:ad4:45ec:: with SMTP id q12mr23325376qvu.33.1604335883176;
        Mon, 02 Nov 2020 08:51:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604335883; cv=none;
        d=google.com; s=arc-20160816;
        b=gW9cUyqwaoKU7gAZLQQBu/y238SZDrU2tWSjCAVdAUFJTyoiOwgyKLJApTV/STUDSb
         zI3/ltF2XvJZvST2QmAWFiTZn+ruWXNIJwxK1sJCawf+jh1v1+ukimzxBvBkIynhmt7W
         PM+jWEtMMZQn+sL6dbIYjcuTSLg0rmhimOx0ndMLdO4vT/RftbGzbvVgVwDlGlrXQHot
         sYAT2jRV893CQ2nG2TwEpQ4gCV0MVIG+HD56FlBZMrD7by9gHjkjE0O/taB8QfxzHKbj
         6yd21P0BZYHilDYDUNVcUo1uihurGTJBBRYmyu4wXEcfqCp75q2M31lWQAet+pJP3ZiA
         sT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wbrbG9ukBQgWC7v+i0ha5DcgXvXrBCVKYGR1HshYXAQ=;
        b=fX+/+O+OipJMJ6G5B/vCq4/AJrdgvRSjq9SHHp9NYvBKb89wGjOYzWzNzV+yzw8EhC
         w9JJg5cDbkTkoy4XtdzjOuN6hvaz+5wRwx10+H5qxJ+4VankufIXtxAa6VNh4hHxFMhi
         uN2q37fSolL/tqV86jlcwY1m2ZWZ2swrtB0Ogh7lwhbWD99I8SAhvVuzF4xIjpx+5h29
         mBw3VxEkMxU0gS5xEHhQsRewP615NZ7fdLgKSwlTU7TkSOXBUVUiP/XNpSpx9UTqW968
         xGnnPX6parYKc8kGiX6wfz2QEkA+dUdbal81nJBCbY31GuujVDnKNpU9SVUr9cfhokxw
         s3rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Jk6wanU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si8931512qtw.288.2020.11.02.08.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 08:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Jk6wanU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZd3C-0002CQ-K1
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 11:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kZd2s-0002Bm-Bp
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 11:51:06 -0500
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kZd2p-0003RK-Mm
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 11:51:01 -0500
Received: by mail-vs1-xe44.google.com with SMTP id h5so7829471vsp.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbrbG9ukBQgWC7v+i0ha5DcgXvXrBCVKYGR1HshYXAQ=;
 b=Jk6wanU6OzFlgeH9+HOxpQxN6tjjZ95SGZwkiEL6sdp1O4jzZPrvzBtCs7eZL1OZi8
 XBqJqfHNLNTt5rKooe6mKj7osmGhr/uZwJYvEDZe0DppGU7E7MhKHmnx0jQSJQS+zkRu
 OFmdyOEyMYjXvoMY6XkpXuP6Dg4TsGDuMS63jMq3IPJBGM3tv+s2kEQlWLMTqcB9FEsO
 T4Ed+eLwlqQv5M4ublYDFLMAWAIuUu2C8KRdpjdMSaZsPLYjUzSajMJUFFWDPpb8+qZF
 7AG4ZwWPH4fsCsnCNcnqNI7zld0cLw0P1QuaxcoL3ZQYj/KkfBUA40srmzDQPLhuJM91
 rr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbrbG9ukBQgWC7v+i0ha5DcgXvXrBCVKYGR1HshYXAQ=;
 b=uXNpKzsLKMVjij6eeoh/qM6IOXtArh8t0C17TYxK7F8M3Ch0gfRtz2tTFxsQQG0LRk
 3AdijcsPRcB5SF4QlfH21U36RFHJ+1FRBrAwPQjRlaZj+2kgUOnHUG568irssMqK1Pr3
 zgDnuAVG3yz+dwYW+DhbiXz/KiDl5nSeOBcjYq90+O2LpW4U9Ep1ulS28MszqZ3fbU02
 Bj4oSiWJBtW+XW1X4uZFlgPiSTGeUBZz1/sjL+FJwzko2lNLrFMkwa32Hh8nBQtjdEKk
 NKCk+RMrY4EeAXRcoGadV1bfCYCtLl13gfnY5dlj3E9QZrefz+jp0yL+wYjewQuvOTaR
 TDqw==
X-Gm-Message-State: AOAM5338cMyzB1H//ExIJ0GioFlkfA1N5218ejERWByJNLoyF847a4z2
 Am3FAXegY2QMT/q0VGPcSfxkpHb0zG9ocwaWUSetAQ==
X-Received: by 2002:a67:3256:: with SMTP id y83mr9493078vsy.48.1604335858220; 
 Mon, 02 Nov 2020 08:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-5-hskinnemoen@google.com>
 <CAFEAcA8YvmFA7=7+CGVpubVScuKPdy+OQdmJdfMD+Fmk+Hb0SA@mail.gmail.com>
In-Reply-To: <CAFEAcA8YvmFA7=7+CGVpubVScuKPdy+OQdmJdfMD+Fmk+Hb0SA@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 2 Nov 2020 08:50:47 -0800
Message-ID: <CAFQmdRZOKLb6=NJoeY9U3eYq3rbG_OWGFDDZdGTf8vjVOA11TQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/misc: Add npcm7xx random number generator
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e44;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: toNYhlAJWZOm

On Mon, Nov 2, 2020 at 3:36 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 23 Oct 2020 at 22:06, Havard Skinnemoen <hskinnemoen@google.com> wrote:
> >
> > The RNG module returns a byte of randomness when the Data Valid bit is
> > set.
> >
> > This implementation ignores the prescaler setting, and loads a new value
> > into RNGD every time RNGCS is read while the RNG is enabled and random
> > data is available.
> >
> > A qtest featuring some simple randomness tests is included.
>
> > +int main(int argc, char **argv)
> > +{
> > +    int ret;
> > +
> > +    g_test_init(&argc, &argv, NULL);
> > +    g_test_set_nonfatal_assertions();
>
> While I was looking at this test case I noticed that it
> calls g_test_set_nonfatal_assertions(). Why does it do that?
> In our entire set of tests, only the npcm7xx test cases call
> that function, and they don't explain why they're a special
> case that needs to do so.

It's often useful to see more than the first failure when debugging
tests. Using the randomness flakiness as an example, it's very useful
to know if more than just one of the randomness tests fail. If I
remove g_test_set_nonfatal_assertions, I get:

**
ERROR:../../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
0.01): (0.00204666737 > 0.01)
Bail out! ERROR:../../../tests/qtest/npcm7xx_rng-test.c:256:test_first_byte_runs:
assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
0.01): (0.00204666737 > 0.01)
Aborted

which doesn't even tell me the name of the test that failed, let alone
anything about whether any subsequent tests passed.

Also note that it doesn't provide a clear "not ok" signal, which makes
life difficult for any downstream processing of the TAP output. It
looks like the test unexpectedly crashed.

Compare this to the output with g_test_set_nonfatal_assertions:

**
ERROR:../../../tests/qtest/npcm7xx_rng-test.c:232:test_first_byte_monobit:
assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
(4.78548397e-05 > 0.01)
# ERROR:../../../tests/qtest/npcm7xx_rng-test.c:232:test_first_byte_monobit:
assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
(4.78548397e-05 > 0.01)
not ok 5 /arm/npcm7xx_rng/first_byte/monobit
ok 6 /arm/npcm7xx_rng/first_byte/runs

which clearly shows that the "first_byte/monobit" test failed, and the
subsequent "first_byte/runs" test passed.

But none of this is really specific to the RNG test, so I can remove
it if you prefer for consistency.

Havard
