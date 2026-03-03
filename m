Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76409EC1436
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 12:07:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxOWg-0007Cw-9t; Tue, 03 Mar 2026 07:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxOWe-0007Bv-DL
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 07:06:56 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxOWb-000851-7N
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 07:06:55 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64c9c8f8783so5789094d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 04:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772539611; cv=none;
 d=google.com; s=arc-20240605;
 b=bOmJeEirDbcvluGMjuUWhp128BzDT9UKQBoFzDxMSV+yAzWRMOS4i7Wi/P20+H1kHZ
 tS8Gwz/WUa2xnPuuz8YFcBv5z/g2v3di04uOtlkxWtKFMaq+e5aYFh3k/6tPz7NK4M3D
 J2A/ABM7D6V1jILT6yjRQcT1BqD2RjzprX7JYgz0xBETd+nBXgdkPv6K6nQcTx3q22Dv
 JoBvFEVn9GUzT2N7jdl9vEruU/xFdUYRHnszn3+Boh0XUCccEEcRyFr36ciyns77XwpZ
 /DMVTdLkl7E6LBkvyAf/+ADgj4Qwn9//9D5tmNUVBZEoo8gJQBgTNZ/VrllR5Pf4Wf6N
 UOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ehkCGb5/hqMEmuZhMWfCZTFaXcJ9oco12dClte5n6zg=;
 fh=mEUvjThYVKlS4+Hmb0ArngSGAaiLJiDc4y5w81IQwHk=;
 b=Si9DhByoLs3aO+NU+l1FnP2KVURl7Thz4G97uBA7tRc+b4s0OQGPGm2BHW05Ky0/sC
 aACIy9rlo/pCmHMRgplZjzvAZh17bO705ZUQHPvBS3ZNGY9k9hMrSr9x3/coIEteg0m5
 MiZOSTTN86R4w2PW97hzLshrhJCpfOnM2E0iQz6isu05cT31uEAu7uin0PuM37mQAaM4
 Jq7JCKo5ysIu3fROWNtw1TBKcERTvjDF7WkPjqVamR2/XlbkSlzEdQbjbAwOL2ZGAaGn
 GCwGINScokvJJDYMZYaEpz4scUz7EFYZtfNYpyc274SRjPJI5y7F8kIAxrEKDJuA9DR2
 AYFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772539611; x=1773144411; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehkCGb5/hqMEmuZhMWfCZTFaXcJ9oco12dClte5n6zg=;
 b=mwBNdywfWWdo+Q5fUG7q1oxu8V3vKOlUMOeeHbCgECm+/Dj9kgwKGPwn3k4cyGQfkX
 sF2Tw/Kta4PBma8XI7QFBwpM+Vjnzb3qm6Gq+cIp7b+Rq+6EKu4zaIOEYHITsFb4EILk
 bHrzm5vb7Sc8cholLynRIjVpAwu09UXDtV9ZYbljFYuECSX76WJEGvYor92GoRvk1NHD
 Z9G/DwrD1M0Q0J6luUyQabC7U+1E7JYE8Gq4/uwqCL8yYl6JX9cOC1nYT6hVbr6Yici9
 dqu+D4B1Dn0Vci22d7TuB0VXNAZmqDIB+gOh/DxGR4YYWImWv4x94LXhMuhYO1mrYddw
 Bffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772539611; x=1773144411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ehkCGb5/hqMEmuZhMWfCZTFaXcJ9oco12dClte5n6zg=;
 b=Y3qSwn/ynIqYWzrt/FgO7SyCw2xEhDYbQEcLeYJ4nUXm7uZgmx32QvK/NR6VulqA/U
 6sVcVBFo0/34d39Acs2Qtiop4WuwqCTAh7qalxG9jo20C95yGUYz4ha2x4dkw2YABTo0
 gRyOiz/xCqbZmJ/ACMWnvr30RenKK0+UuK0UxsXHaafGOySlKR1NsTIhwI3OwMp5sDO0
 nKvbuZA9M8d4p3VIzWuooAUdZAg9KyTDYJ74rqdoJbqih17y75cTN3ptwpj3aTLBdMfL
 FTwxHG6AVkfJukQKINaE+/2GjvbaKV4sBEYTWLB7Lc5DA/15ZRholxMllg9GGVTyys/v
 s5TQ==
X-Gm-Message-State: AOJu0YxtiJvSAwlp9tTTVVjUlZ3h7x6sOUnZbd9xdFtNQ6ViYly439gS
 qmRircn/nW3yWMSQbbbCuf0plHfiBKctxZBW1o7X5uYQ/yINWShCfFpQIaUDKqIyHrJcRdVQonP
 f8Jk61f2xm9XNJuSqOwcImDSWlG48Xn6wcf0/ELBK9g==
X-Gm-Gg: ATEYQzx+IXJPhEnNECLXtNdKVendoiZcHmvZIun8C5kOdf9CSUwdpwqD+HPDLaUgcui
 W84Xbq2aGsczCKEa080VssJf6zifItb3+lU8rF6bhaywxUSEjUsFGgqnPAOhofQwyyzVD/pueit
 RKQ2it8kroBc8JqvCo04IoK7jJAXUh9wGJ+LAfMefeKPFfPQ0EqhcRDHw+RHj7ozIVrDeX2Iu0f
 nllJkuEf6scolBQ7AvF2hgzy/M7Q+Je4Uh90QsfVdQ0r4Fs5IJCaycr+T8q9m3LvzPXdmFEJqfU
 DurkXGATDrt3w3J3vUllL/f7l61LlPHdqWfnhAOVRfrez5ygSH6VB6j0IWgbiTrtGQ0=
X-Received: by 2002:a05:690e:1686:b0:64a:d18a:66c3 with SMTP id
 956f58d0204a3-64cedd494a9mr1198183d50.48.1772539611222; Tue, 03 Mar 2026
 04:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20260226175549.1319476-1-peter.maydell@linaro.org>
 <65e0593f-d5d6-4e22-a730-ebe65bc1a332@linaro.org>
In-Reply-To: <65e0593f-d5d6-4e22-a730-ebe65bc1a332@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 12:06:39 +0000
X-Gm-Features: AaiRm51C0S1WaXaJRwJhDW5kTXSffAuX06l7M_9kNo6a__BHx-7jq0mMzpLw1aQ
Message-ID: <CAFEAcA-U0T9c6cZpyoPs7iGqLM=hFks8212no+_H5hp0jcNb6g@mail.gmail.com>
Subject: Re: [PATCH] hw/net/smc91c111: Don't allow negative-length packets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 26 Feb 2026 at 21:49, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 26/2/26 18:55, Peter Maydell wrote:
> > The smc91c111 data frame format in memory (figure 8-1 in the
> > datasheet) includes a "byte count" field which is intended to be the
> > total size of the data frame, including not just the packet data but
> > also the leading and trailing information like the status word and
> > the byte count field itself.  It is therefore possible for the guest
> > to set this to a value so small that the leading and trailing fields
> > won't fit and the packet has effectively a negative area.
> >
> > We weren't checking for this, with the result that when we subtract 6
> > from the length to get the length of the packet proper we end up with
> > a negative length, which is then inconsistently handled in the
> > qemu_send_packet() code such that we can try to transmit a very large
> > amount of data and read off the end of the device's data array.
> >
> > Treat excessively small length values the same way we do excessively
> > large values.  As with the oversized case, the datasheet does not
> > describe what happens for this software error case, and there is no
> > relevant tx error condition for this, so we just log and drop the
> > packet.
> >
> > Cc: qemu-stable@nongnu.org
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3304
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/net/smc91c111.c | 16 ++++++++++++++--
> >   1 file changed, 14 insertions(+), 2 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

