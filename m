Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3273632lft;
        Mon, 4 Jul 2022 07:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVE2NPor1gW57eq0jHJnNte1S560PyRt44iEE2Zyn1PEMzXP+zxr5cvRLqQGMIViSVs61/
X-Received: by 2002:a81:18d2:0:b0:31c:9dd4:66da with SMTP id 201-20020a8118d2000000b0031c9dd466damr4635158ywy.394.1656945328692;
        Mon, 04 Jul 2022 07:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656945328; cv=none;
        d=google.com; s=arc-20160816;
        b=NWslA3mxdNuvyIdGvIsG4njsDEpkrTCKs0Wmz7qGnAC/6sWx/jfm1SiWkXFpbSbO4s
         mJncFcnXgjFzM8fNkxBfhvTjjFXSLdHLtIo0+L3W235Ybw5atIZxOmwCVCx0MeBkiQjp
         HMIE+DEd6zJn43CUYI/bgLxhV0uPR7u4P5NNNsFXyt77i6MZEBzDjva0GrWMBqOjd/yB
         LzpZn5MgMtFWXbpTawvvnqBNfPEBeyUbtVhyipyg9X55MyV+mZQ7aly0Gl7Ys2z0vmOR
         fM2a3CErJ3smdxVlj8fWlcqNDzD00HrQavqOhLibyExzxvcE2mnVVqra9+BLfmbHVml/
         kU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=832XTr8KnCCb8qjYa18XlWYpctrAuaSk1Zn5WeQ8iTA=;
        b=GppnqfOuYnVQ0z/9JjfePCzEGpDW07sNYHnY+5V6PlyNHaJp+zWik4qCv8Qs97ms99
         LWtAwf7I6CAJsB4i/B7hk7s+Ji8LZ2s9FtzVDwg4t1nQkaG/V1pI3GY2hYbMxfe65dHT
         SpiB8GmxiiCyWkqNnVW5QB02urAALcfScv3xmRrNQkJHRaGwN35lVZTLZzzpEXpqR2UK
         wxTrWq5kEkR1VwDXwcpoEpxOSQwoUCkLz+dUkvjHzYjHw8z8cfAuSnJZPStS3Z+HfH+K
         AR3yhpjoHrBcbLhg7yaRFwQVwEMbSC0nclIe1C9EqcSXwgXI8IpYgnnfXZqx847lPEjc
         BAcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjBJ7c8U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2-20020a056902108200b0066c7d0e2ca4si44886531ybu.402.2022.07.04.07.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjBJ7c8U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8NAe-0004Dl-2Z
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8F-0000Gh-48
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:55 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:40454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M8D-0003ui-H7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:54 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-317a66d62dfso82209657b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=832XTr8KnCCb8qjYa18XlWYpctrAuaSk1Zn5WeQ8iTA=;
 b=xjBJ7c8UBXeB3cX9N0W/34Nhh1JDZehn70cGsoBgCYfU+eDVZkNYIew5OpdxLT3Uw+
 QChfDVqAxRfb7KXf4Y/aIQjaM0b7wPsEcQygIzEootW8iwCdFSOHO/DZqQn4gZYwP5+F
 yN/NL/y1u2ARkjd/5QU8WMgYRMbTMT3vrW9d37d6MTudhoNhAku8O+MwCDJ6KgfWR7IF
 CbwST6wqnwUl3zLnXbHHFDvpUDyj1EqTw7MES3y2W3ifVUOYb4mNqH8sv0zVrMwV+oMv
 KSIXsbEMJnKEVV65LWy1dF8OivqmM5Df0GjkI+TIcPssfM8EzvI1hdvXOIo3DtpOpLLY
 A4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=832XTr8KnCCb8qjYa18XlWYpctrAuaSk1Zn5WeQ8iTA=;
 b=BkUs1ZJlI/R5zqELQK2ink7reRYTCZAWFNHA9gyr4DDdWKpa1AcjTznlNJREpfrh6x
 HqQf9XvjWCrow0AZDv9aah5c3kbRR8b6oQ5GUUvMjpfdpYrC1P6jzqvY+SL8xGtvd6yj
 iumNRzsTrdBSDBeXrxpuBw6yU7rEZCgsdB1wQ5MzDxURBkwt/obeC+tdLs+HwB2qn8pW
 7UeOtnvYNks/QvdGmIdXa97Q6EHgKL7CcZkDUCRsUShQ0UDS98FZHLiP5htbCn9Y3uwh
 KC9Nf5aK31tz243nstSMoIj9tUG9xuBc1wNJoBnV3cDkBj0DHgZ/zdFcpGPGqrhjauWD
 y7Zw==
X-Gm-Message-State: AJIora9dKguxg+tHnN4a8XoNqAH3sG9oCve4uZOiSWoeaoObMLAzvdmd
 w/4pDc81zpDtdwOOgR+0M5KtbJPXHdjD3GdfYCblXA==
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr861320ywb.469.1656941331889; Mon, 04
 Jul 2022 06:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-30-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-30-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:28:41 +0100
Message-ID: <CAFEAcA_=zGYooKT6tNp5cJRDYj-XcpxSssd9as21st_DZav9Pg@mail.gmail.com>
Subject: Re: [PATCH 29/40] lasips2: rename LASIPS2Port parent pointer to
 lasips2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cf0fOZ3vpE8w

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This makes it clearer that the pointer is a reference to the LASIPS2 container
> device rather than an implied part of the QOM hierarchy.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
