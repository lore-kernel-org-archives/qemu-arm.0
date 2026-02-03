Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FACE87821
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 12:07:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnFBM-0006lE-Ev; Tue, 03 Feb 2026 07:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnFBK-0006kE-PV
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:06:58 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnFBI-00009Y-G9
 for qemu-arm@nongnu.org; Tue, 03 Feb 2026 07:06:58 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-649ae700ba0so3465049d50.1
 for <qemu-arm@nongnu.org>; Tue, 03 Feb 2026 04:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770120415; cv=none;
 d=google.com; s=arc-20240605;
 b=Tb62hoB7mNamNRVjODR1Z/zholKi6aSWogrI08rwpFiP0ulR8UJLg9SkzJCh0baG4/
 Ul0A41TF6ZjcefbDbPGBu7wQTcMQ0E0eyTOOxyYi79fzTdOjCtrfWnu7vDSKVzcBn7c+
 6b1o1GILl2hLVn0YoSYOJhh5Pm6Y2ekkirxPRAyU1eOq1OVEA4N8APlVjT8e3wv6G0da
 dQ2g8jcSQ+EeFlWEg+5FLFSn5HS0XcpGydQAtoypa5tdmzJ8S7l3phY6bPKIffw19sAL
 46dYulsEaZnLlG68Vu6G6iKTfZkuxRBnixroi4vUwK7RICt0hDP8uapP/7UbyOJB/M5U
 lCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1ykvjwTQbpRv8KzJHJarBZqCtPTrTnHI1dt7XSGI92o=;
 fh=BSqkbdB9Gb8W7vqBfDMtrfUWutsLIBSLrBBafelSg9w=;
 b=PYbb7tkSWvbaeUEJQxCjpKaKdNt/NQmvSbNOnXu36Hi9e1ya/P3sdOvlSKqDfn0p2K
 INb8XcU22ASWsdT7aFs4+0EIv+m4le7HV/dJOZaVqCfl0kldYp6vgza5IEGlBHPiNI42
 /vV9v6GCYqu+Q2WPMZzRUDIv/A0oXJi3ZSbTnpszI8lAzsI614b3EBOl7r7zMl0EAY0e
 YT35jf8MJdRkMSDghhWMQvHYvEEwUxMNqcZFOEmpNuCgVufS6rVuQI2sljV5ky0sKNQP
 K0Tt8EzGfpVb16fwC8l2t2l16R+yv/kfrEEtPb5/dflAiIBpKH+EnbPyjic3CxKvrcqR
 f6gw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770120415; x=1770725215; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ykvjwTQbpRv8KzJHJarBZqCtPTrTnHI1dt7XSGI92o=;
 b=rK7eogWSgTmXPRsKYpTsWLlm2UULNr9qRn+zbUsp5DZJKRbl5pdOMFNNO5Eaq5MHQu
 99VkQenYX/yu1r78Ao/uwDsMgeVl66/z6/RTEI36KUZQjukCsY1dVwFFLheJS+phjOiN
 OeiANKAv5V7NIT9SJ9NPzbGiKnuhGUINhsTAe8bIOXg0MJC+dZwNO8apzl6mGf/S6/Vn
 tmexaCOXlwyxVNkn1qdPn+xTvcZTVAPmoyTcwNdSBT0uQUQERgOLv+rP/vjC+owSqgUI
 /rqXpKphPnr8D/4rLrTiHZiQ5ziZCuylRFcrLWGSvXwRiqeCJq0mNGAPS0/g47H4lHw3
 RdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770120415; x=1770725215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1ykvjwTQbpRv8KzJHJarBZqCtPTrTnHI1dt7XSGI92o=;
 b=HzIqsIoy3T4DHPxdLCLgIJiZ9kOEOhGqCoDLelYfYCql3+2MH5nkrAYcOD5jASsD8B
 ki2XQZ/dj0B4kbeCsA2M8kclFTdVFiCOwU65ZVwRZVWB+9q4lbG/8LkdlNO5DC3BZBZ2
 dCRImt0kMv5oa3LWGVsjTJBqTWV3hGSQoVr9w1e+xfA4GTzDleC3XObu/6OIhBx6B26d
 x0I3baRSJldW6XpZEXDi3CUpu6Hl/ij7uEFW9hj7qmhxKXyE33Eytwb2vfPlFnfikRA9
 z4wGL3l8iGW04JDy7ohFIZkO+sLW8w9p01tx2QcUt6LskVPxrQYcZhTYqo4NnRbnyr2I
 I11w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUsucdc5ac0KQJKFm6k+7yI1z49I3s+WebmGVhhwebe25UijTrCmEQgzPMk3Rv4lbVXJGS52CeEA==@nongnu.org
X-Gm-Message-State: AOJu0Yzaql1K2z+KNvvbMlJ/zbPKQqAtCems1mhoR6aD1zhGdBeQTx06
 G/sVb7PVR826m4NPzEFrSPvR6mU6SQ3sTFrluSLRmIJk0Qc345v8B4D9fYzcK9fBOdVL7aUavg0
 nW0rPaWz1BGU3mfm7K+QdatSJGgdt8ZjSHAtRWgRHcw==
X-Gm-Gg: AZuq6aLj45xxNh/+N9ug9usuXqxvrRs067ve1Yp9zrYdHrUnnIE0vECKTPsk3Kwq0G2
 BiKSwYkkD/bRUbiiXKcMa9bq+ctaR70CEJePgCnavfVqOPnhFmnnpRfe3y65Th2P9k6q8RqDgS/
 Nl7vNwt4JRvHvCJATz8HzScsQ+vhD7dYtieDP+CStXQNhun3TEsHGnZfuPdfIqYAxt/dhjtipR6
 EmIs/P7f65zkGWSiB6sPBoFqx/7FeP9mXA/t6zXE9F+tYbqYnDCgsEdYlhgcDJAxQlRNA==
X-Received: by 2002:a05:690c:4b8b:b0:794:baaa:ccb2 with SMTP id
 00721157ae682-794baaad2a0mr194716507b3.6.1770120414888; Tue, 03 Feb 2026
 04:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20260203115201.2387721-1-alex.bennee@linaro.org>
 <20260203115201.2387721-11-alex.bennee@linaro.org>
In-Reply-To: <20260203115201.2387721-11-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Feb 2026 12:06:43 +0000
X-Gm-Features: AZwV_QgdRJ7OfJQizXGbRJ6Xq7Jz4t-wxxvtSpokK71Nv8PRhI7_QQ7M8Vz4DNU
Message-ID: <CAFEAcA_V9vCSkZ-qPWw1s6qtqwhU_gbS33K0wHThpbxsfLrbmg@mail.gmail.com>
Subject: Re: [PATCH 10/11] include/gdbstub: fix typo
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-s390x@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 3 Feb 2026 at 11:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/gdbstub/commands.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
> index bff3674872e..989a95c33f9 100644
> --- a/include/gdbstub/commands.h
> +++ b/include/gdbstub/commands.h
> @@ -50,7 +50,7 @@ typedef union GdbCmdVariant {
>   * '.' -> Skip 1 char unless reached "\0"
>   * Any other value is treated as the delimiter value itself
>   *
> - * @allow_stop_reply: True iff the gdbstub can respond to this command w=
ith a
> + * @allow_stop_reply: True if the gdbstub can respond to this command wi=
th a
>   * "stop reply" packet. The list of commands that accept such response i=
s
>   * defined at the GDB Remote Serial Protocol documentation. See:
>   * https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Sto=
p-Reply-Packets.

"iff" is not generally a typo: it is an abbreviation for "if and only if".
We tend to prefer not to use that abbreviation, though, because
unless you happen to have a background in mathematics you probably
won't recognise it.

In this case I don't think spelling out "if and only if" brings
us any more clarity than using a plain "if", so I'm OK with the
change itself and we can just tweak the commit message.

thanks
-- PMM

