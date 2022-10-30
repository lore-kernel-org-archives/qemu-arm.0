Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp414155ejc;
        Sun, 30 Oct 2022 11:13:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Gxmmwsj1M3i3vh/r/4uLlGbvHgTL/XMYGu0sabglOVamiGcX9KUOnt43NySWElxS8s1kC
X-Received: by 2002:a05:6214:23cd:b0:4b3:edb8:4aaf with SMTP id hr13-20020a05621423cd00b004b3edb84aafmr7780762qvb.112.1667153596185;
        Sun, 30 Oct 2022 11:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667153596; cv=none;
        d=google.com; s=arc-20160816;
        b=qDvCL6bbnS2dIBFYZzmwsNR53GBlYnaixluNVi2w+7JI2Vb7KQjmSaXqnQyAX374Et
         K5iljIXPWJZYHQA9oY4FJNcxrbpngDTVhbf6F6ZnPT639QH95sbeEwmuxHu9BbO+iGz+
         P3I+OZ3iZffGkthqUBr9BQZ6yuAyRA8wNSuO2B8nR9FnLrFPavq8n06FalxTMwJ4GQn5
         GCjTYFCyJGlHXkaVi7A7RPER5J8+rYdwsp8zWnL+y2ntlFexKUlo8dfPXF+EfVsNsb9Y
         wOVtu43bfnidSewZLh5KRj0fsr1aYdRQykzO/nVkTPmgHzmRccnfzzydpgLLMmq1wpVL
         TabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7m7QPGiCP4S20D0BtAIqmAJC7Tsy8GJCqBiUeHUzM1c=;
        b=ap0MsHO6+WZnVjBL8L0GuX8QViJdyrJUz4zsR0biJe28imyaUkpRAuNUAj6ItjHjBY
         6lQRLO7gmjXSxHzYygF3Pssptp0H0x60wDlwh8exFJp2vg7Unr2NpsSvH/4L4y+QyPWV
         LwzZ5Lmc12+B7HJdmw+5lv4omAl6GxsuvPp+ekLzOCi5LKZQh4JamxuyWGxdEslOZ05E
         eUwjS/kEUP5eD7baGgkNQHuMVLPCZRO3POhR1/5glo9rEtBsd+btD6I8BVaapbrF7my3
         AvWg+8sUWTlt9Vj2qK9ViOA9A20lh4+qBYLCM8bHTHyjq+cFRpY1AbWJc1liwujfaU0O
         hdEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bNIbRwdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05622a01c700b0039cd5cd2cdesi2832510qtw.478.2022.10.30.11.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 11:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bNIbRwdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opCnt-0002sJ-80; Sun, 30 Oct 2022 14:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opCnr-0002ri-AE; Sun, 30 Oct 2022 14:12:59 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opCnp-0005Ix-W9; Sun, 30 Oct 2022 14:12:59 -0400
Received: by mail-yb1-xb31.google.com with SMTP id z192so11573668yba.0;
 Sun, 30 Oct 2022 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7m7QPGiCP4S20D0BtAIqmAJC7Tsy8GJCqBiUeHUzM1c=;
 b=bNIbRwdqyFoWXlx9VdQMqsXJi4ZwRoXHFhbo8L3yuEmlB7W1vE4ntlbzJ8jRU78zVt
 oiTsD15qESfexMTv+VYcs3I6WMsHKxcQpRi3kgwhlG1Nu8/l/hxzFMkCqQCABJxdDgkP
 CMdZZQEl3uEj8i+agfO94xmyAmPz893p8WfWc3uSQYozvqhaqCZzrAWGGE87AG/SAmU+
 GwIqyWtj55q2B+ePALyhQPN3+e3bhC1y7eydBeIRFfOA3SqZ0fJv4rjr/4MirwTCM5Jq
 kT7el38wvzOslqxb66TLVFCB+nnb0JVEFVgKyheFkKH9l5U9ziRZUNHzoif1xDx/tB1Y
 B6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m7QPGiCP4S20D0BtAIqmAJC7Tsy8GJCqBiUeHUzM1c=;
 b=JEEgZfeDCwTP/kg6fv9IDifYZsWpTf0GGh49Lsg0JTL/bJRGdkfgstEzU7X/fHhNXw
 cPHqhdAneKbstQpugCUm5WlZ8zSRfBVOOqbVWqF+7zgntXD7bwPvY8jm4uf8qzPGpmD5
 je8wCqmbIczjh2+NXMAMI0WW/W5NV+2s5Udrzz/D1rz7CJ56se7ncNN1Znzu0R6XpQRC
 7T5Z+CgvdXEOctc9d7niqV3yGEg80aRlgsuELFUB9s80P8XoCMeHbzme4v7gaASK5FNa
 j9ZkubJwaFOAEtvmfxyqTYGCne11f5R+KbQNr3htPLp8tX/8cW/HdxVUksgnqzFr7r23
 n4hw==
X-Gm-Message-State: ACrzQf0YIIV0aywxwQ55Xdzv+lswbFpFrcrh+i5j+GpaHUUAAhnAQmP8
 D6coEQ53BUG6QrLGeHqBb+k+9bQW03N02BaR8Uo=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr9890849ybt.118.1667153575955; Sun, 30
 Oct 2022 11:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221029172515.217264-1-sw@weilnetz.de>
In-Reply-To: <20221029172515.217264-1-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 30 Oct 2022 14:12:44 -0400
Message-ID: <CAJSP0QVGbW2d0vJzikE4c56hro=GqeT4Zx5+d8P7PTzG9c_1hA@mail.gmail.com>
Subject: Re: [PATCH] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MzAMRK2jbuGP

On Sat, 29 Oct 2022 at 13:27, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Most of them were found and fixed using codespell.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Aside from Peter's comments:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
