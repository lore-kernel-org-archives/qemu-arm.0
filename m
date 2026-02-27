Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E8FEFB7F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 19:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vw3EC-0006uW-4J; Fri, 27 Feb 2026 14:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vw3EA-0006tB-HO
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:10:18 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vw3E8-0006vP-QP
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 14:10:18 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-649278a69c5so2150423d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 11:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772219415; cv=none;
 d=google.com; s=arc-20240605;
 b=CS70L/ngqZb/ImUJIQETWkoPx4Ei3W18O/IoXZiKmqxrsXhGLl4p9FhZ2Bhxx1rmxr
 NDCT5Srv2uY5BorsIOPcNJiNPGfXUxI0CavL1fiWrUie7VHohZiYuWs3RzXTSGkGqoZ+
 WxQpsT9TlcNoCdoOXIrqgqHT4Cwv4iuQ3rwKEdYIwDVsX+k7tB26fdme8Vrko8G1vmGc
 KeVsO5ejSpxrlXJYsbZIK3S1rk+8ndZe2KKpxrgjRcinjjkjeyRb00Va/jb2HFKnGkqF
 lEeNGd/P5LHS/C4kQ2XSU+c6iHd7zlaOgr3PbLtZtZiiDl4g3qxnPflWZTHU7ds2qvnm
 XffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DD6yn6NzzigaBPzH+pNo8V6nWbXpvcqKj8f3rHF3t5Y=;
 fh=U+7tNHDaFPWyYcN6vfXMYAsPt/D348kAsUUpYANrNSo=;
 b=OhF5SiTBOOaosOB46sXngkg5SJXcvmP/fYuJel8DLQq8SAFdUsJ9Ol9MgNiIN+YJMC
 aRQLVr8xExXxxgzcqL+V/jftX9djls6fADlL+4PLFTJt4Y7f54mQQN1k/YCMvKBYd4YB
 pf9kHj1B7ytaRa/QSvarIkKFJcSVpKMt4O8oLVMcL6iu/b8cH/D3UQn4aOzY08hx34Qj
 GganMfx3q+Mqhdn6cGtW5rU5k8WTxyJoSSVDQOGZPoRcMnFev83UzhA1zXNTyUS0ytzd
 hThOtzSlZ+rOXYBb8ZuniE53Mmmj3q4MzY77TfNnvw8j6ktxg2t2HTOIPLr+nxo4rP7M
 Owzg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772219415; x=1772824215; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DD6yn6NzzigaBPzH+pNo8V6nWbXpvcqKj8f3rHF3t5Y=;
 b=eJi2Hu4eQj9T9RCRPB2lX55mcwHfc7naNowyidKdU1juo7N5DvfvTIBdEEKzfHi/Rj
 ay5jOSmhT/9rJzXq9/jMyyMzKeT4kYDZ3vRibrGsuoWO7E/8/Z82hRnp0xNFzRMDTF8y
 9TvGlasDFtjVNXROaug0FzM34K0MemoXYVUuyrcJy8dmrcBrIBHhTchHr4iTfxIcBKnY
 gAZ6lmOkPZUziW+hZcjflky5To3LmIGSREHxEy7cByYMXKjSFHq3OZhDO27S1mVihKDp
 O3+dpA3vtA2G/N4WkY/xIxUF7ak2WRrehHjPtyJFPc8D2lxbjoLCPnArt0ihI31J2mXD
 pM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772219415; x=1772824215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DD6yn6NzzigaBPzH+pNo8V6nWbXpvcqKj8f3rHF3t5Y=;
 b=DjN3tRCnXQG4GWjP3k5at1eWPpuNCjbaSRakHoS348kUDnTBIKUAfdLd4TyZ8u0bEU
 eAnsT3ZUcmvX6M+xswVu5hnc2dfu5O4nb+XbJbrIg+YvhwIqwodb8nUYs3hybhTF+POB
 SniiBKm+Cdq4ZH5KwlBUvmHPe+OFxbJJpJN0/Th51qA8dWaPwx6YM0P8aI1WfziXIx3O
 ul9HQcM9vRN8qWMi0ocotJ7EyFgbST9p5eVLaXLC0AnfPiGk5wlwOabhZh2rHqnESC+J
 jjxfGDz6somRy5Os7+UkHXS8SOmi0jEKOdSV2J5/puKS3IZTfE4hm6QP1W8t+WRyUwn4
 G0wg==
X-Gm-Message-State: AOJu0YwBLBE+j9acfHDD6F+qGEUBarmKzzoawg3wzqNhhH0ttUxb4C8G
 l7dNPlwJ9AXI2MindlbI7U7tshDuLcEXKW97BfuIE9c/7pVFs2K84/Yf2TlqWGYID2woFHOs57m
 3eWOF2e1URydE6a2ihioRJmdXHPLfxJEFjraTf6jVwA==
X-Gm-Gg: ATEYQzzZkmaBE8sbecaG5F0hhZWyanNGegAv9ZNEr3mRKOZsD1KH14E0L1i0nN3peht
 hwwj5vR1sNhhTGMbhe7MmQmFdrMGGvRpSLlWf3bB24BNJ4CgpzckR4+RN1LzuXWi7BIeIIs9XXJ
 PhGs63WPgi4MRmCIPU6a2657pydte+6KE7m7AyHw1aPZKlJPyvl6dgZWzqckIVTG81O/08hsjOO
 ri7btCx7/3vWu6JIc43y2JH/kbVxX0881Uw7Y0w5vSnxCxbK3pgphULhppItmHz5PuuUCzEOgU6
 iZFrsS5InqGhQSQMamCB0pHI3pk4+kUaN4w3w05yFuqrH6/moclNIiJB0pSkkmIs0EQ=
X-Received: by 2002:a53:ee49:0:b0:649:4bbf:9a18 with SMTP id
 956f58d0204a3-64cc20c893emr2458993d50.23.1772219415292; Fri, 27 Feb 2026
 11:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20260227135736.2280161-1-peter.maydell@linaro.org>
 <20260227135736.2280161-3-peter.maydell@linaro.org> <87ikbi580c.fsf@suse.de>
In-Reply-To: <87ikbi580c.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Feb 2026 19:10:04 +0000
X-Gm-Features: AaiRm53K4eaqXv8397D5JpyU92Zcz5VEA-gpekHzUjaaBRpXxdr3XZooB5V9WaE
Message-ID: <CAFEAcA9+GzKxWKLcWvT5e2voO0mRR5jaKfXk4JrhWU6jFGXpNA@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/lsan_suppressions.txt: Add more leaks
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 27 Feb 2026 at 18:57, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Running "make check" with the clang leak sanitizer reveals some
> > leak reports which are either not our problem or else not
> > a leak which is worth our time to fix. Add some suppressions
> > for these.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
>
> FYI, mine has these. The first one is on my list to fix once I find some
> time. The last two seem to be part of the stack for the ones you added
> here.
>
> leak:qcrypto_tls_session_push
> leak:gnutls_handshake
> leak:memory_region_do_init
> leak:qos_traverse_graph
> leak:qdev_get_named_gpio_list

qdev_get_named_gpio_list is definitely used in paths other than
the qemu_irq_intercept_in one we want to hit.

I think that recent memory region fixes ought to have fixed the
ones you're suppressing with memory_region_do_init.

I couldn't make any sense of the qos_traverse_graph/walk_path one:
it seems to be related to the qtest "subprocess" functionality
somehow and doesn't repro without that.

thanks
-- PMM

