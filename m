Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B730FCB619
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyYBW-0000Yv-PA; Fri, 06 Mar 2026 11:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyYBT-0000Xz-RF
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:37:52 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyYBQ-00035V-O1
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:37:50 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c9f7576d4so7065371d50.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772815068; cv=none;
 d=google.com; s=arc-20240605;
 b=GKD7wwzL35aIydq8aON0uEZ8LD0GfUO0icoMQ5RB2jlKH08Ai81hJP0U6AZuxzoMqB
 lWazovVeAYjQO0ZK1BcPc+TzhsIh0VKaV2ch4/o51wympw9j8AdsPbQNfGOMtsJM9iaX
 1iKueIOKm+gPQZ79EzinLSj5OXML5H/CrGRhlWbyt36cPnXNmKiY7vwmTahy3vQY39Nx
 kLXkTJ/42Y5eK886LQCPtXpqVSnwXDtd5tD0mWQ/iHEiR/snDmRnkUzV+uV5zEoAKiEv
 FbJGTzfA/YlT3jciD64un3PmrlR/VzIvNYYIhDF1Vur0SGrCpgBD7j51E4K7wWpXw0Ck
 meLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fhj5UqzymciJmdwmXwAsHdo8SvA2ratnUFK4+SJ84us=;
 fh=8b/K+xldOB+w10Op5UgtFzZCG5b+aYkeW4AFj/QphjU=;
 b=I3E6v8cWo2a1DMKcjrTzXv+NyvbxyGX/YasEY9DugXIOzNXSip1sw57Z6B49svVLso
 8Dd+bUaCIVe9434Hhg9dzMRfJQKACnhtQpeSZ6aj3XzsyHbu+DKMqdINPpsuXxh5jZ+9
 WLYLNlD5UknuFRd+v8oSMGwNrcDGyySlrx89F4lxKTqAIBavOSVQ4RsygOCY/PSMfaJ8
 xPLOBvY76orgIaq4wr6g+MBvHJtkr0XGLbhcLIMX1R5ZWI584IuOpnOmWvh5zsv1otHh
 TYgl1s9BApk6HwH/fqbZMsxmjNQHBrlmj1AA3tFun34GJQmyYceTlU1ZkUtlcElPZYX4
 tcog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772815068; x=1773419868; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fhj5UqzymciJmdwmXwAsHdo8SvA2ratnUFK4+SJ84us=;
 b=GHCL2UxRYNnZvmpaYaIaVs/wv+Ppt13u379iFcEPdLgj1+maPhmwSS7JnKdZoJaw7B
 nbLBsmmuv5vgxz/+bycGT7D5MUOA5Aku8xUXrcp8r6IiaUunH60gX//sqLe3VkyctMhq
 /eUdhgKJ89PTxnHnhI6ZGCsCc396Y0ZcO6jDnrjRSDaBOwuFRXhlmAY66U6Gtd/Ec4Wv
 /fbp9UnEQ9tkDg85T4t+JFgyDhZtyFpjlUCmQKNHCsKWhadjczJ+8CucNDAaz3L+qnFO
 N53cZuXygwakplPGKBxZdC75pxJLaIAAu8dmpXlSPYji25KU352O0fDU6DAjJYhL5iaT
 YMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772815068; x=1773419868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhj5UqzymciJmdwmXwAsHdo8SvA2ratnUFK4+SJ84us=;
 b=SG7FIa0W/qCTagQGeZZhufaReB4z5FDD0ad/BpBHlg5MiTqsqppxtVzmg/M5iN1cXG
 AdO6pZHAfzTD9L7/wob/O2y2aT0Ej2io1Hm6PXa/I5G9CQQ29v7wcbBKv81yU92ZbGVB
 6lZlGScZlj3bV9kjkL6znTtgUtn8/EpU/xqWAbdrBu6PNPaxClcJbee7ZwgCRYWspnsa
 vBUA0JenfvXOD89xYPgCM4Bk3bhuOYdc1Wa5S83nmHWQ2AbQf+Tby4TvoHabdLajEgre
 mne7blgwIIlB+HLbPO+Qe+dYJ0pTHTHlveGXDGbbOkwm3v4H6J44L1hTZT8VoadpfOfD
 YSyQ==
X-Gm-Message-State: AOJu0YySgoA72ZM3Na2xXi4cFi+uRECFXXhxjld8TXGUM0PVvcGHfjf2
 KH2zkOFtcKcFoWJMEFanyj9c2/SJ55483kAoq9d883/9OC3GCE2YKvCN4EmYlPtGdkV9jHKmTp6
 rtslctSSIAiKTldRUhTWWZWTVv9q/fiRD0rAK8NkJuw==
X-Gm-Gg: ATEYQzx9kvrKmec9LpAErmADCSY68Mt7J6JYLJcXDJU+XHxQwpKYLE1nFgY2vCnQrnQ
 zyOBVDiSlB/Peaw5eivkMt/MAzbSvPBuniKuKp/MyN75UC3MoKKMH9xDcgcXJBmOau6YfVEzRIM
 6vlyr/MvkFFkRPfMDUiaZscZR28hHjzaha8ckehbM3RNqg1Rl992M7LsT6eoZHTYj3tmyou9Olb
 LW0vN6rgpjbdLeoXu1gtp6dTC3VPFBf5Zo166+SHrlcdFoKexFxBa+aQLNAZAqjLuDZcLT8XT68
 V8PeHgLphqtw3YNhg56ESLCOrBsHeV3V+knRXluV4UvJ7N0/5AvXlh07gDHwaDe+Xz16CeyDFOF
 giA==
X-Received: by 2002:a05:690e:d4b:b0:64a:f163:1554 with SMTP id
 956f58d0204a3-64d140a365amr2391295d50.14.1772815067644; Fri, 06 Mar 2026
 08:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20260306152140.2191653-1-peter.maydell@linaro.org>
 <aar9otqHQI08k2sN@linaro.org>
In-Reply-To: <aar9otqHQI08k2sN@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 16:37:36 +0000
X-Gm-Features: AaiRm50bKbe_rYJYWTnrZFjFqS8YH6YLuBOBhvFO_Hm9U-kS0YUIIwzcJsapE90
Message-ID: <CAFEAcA-1V1okPnAdoeEse-He-_dxVan=R39yLX3xFW_bTbme-Q@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/pl080: Handle bogus swidth and dwidth in transfers
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 6 Mar 2026 at 16:15, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> On Fri, Mar 06, 2026 at 03:21:40PM +0000, Peter Maydell wrote:
> > The PL080 TRM states that the DWidth and SWidth fields of the channel
> > control registers can only validly specify widths up to 32 bits (i.e.
> > values from 0 to 2) and all other values are reserved.
> >
> > Currently we don't check this, so if the guest specifies an invalid
> > value we will transfer more data into our local 'buff[]' array than
> > it can hold.
> >
> > Check the widths; since the TRM doesn't clearly specify any behaviour
> > for what to do on invalid values, we choose to log them and then
> > ignore the channel for transfers.
> >
> > Cc: qemu-stable@nongnu.org
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3203
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>
> Thanks for picking this up, Peter.
>
> Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>

Thanks.

NB that you need to keep qemu-devel on the cc list as the
automated tooling like patchew and patchwork that tracks
signoffs only listens to that list. (The rule of thumb is
"don't send anything to a sub-list without ccing qemu-devel").

-- PMM

