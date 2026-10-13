Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59700CA9ED2
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 13:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGcbz-0007l1-Il; Tue, 13 Oct 2026 09:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGcbv-0007kC-II
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:32:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xGcbq-0005jf-RO
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 09:32:05 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ace0741488so22949007b3.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 06:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898317; cv=none;
 d=google.com; s=arc-20260327;
 b=RMiN29nPgOyLRmSza0Wm5EHrQRl6NTvR/wnIvpA2Bn92YA/rKIHa0zjmgZbecKUMHu
 hLDZ/wSwz/1qT7fUIwH8pVK8tlTpRHizCBLe4+Fhr9SbiCgHmDbOCXPQBWuZHQpPiMUW
 lDuB4LIqLz9A1DVDsJ2aAzcfrpLMfgCDYYGKef2nphelOT/ikndg/eouiZrc6Fhm6g39
 G3yAv8tnn66+X3kULXTy78VxLUx/3H3iH0i0nS4N11WcG638w1XLjbeuu5CRHwDzNqls
 3WdZ33+gjWowBzhGBPQ3IGpRd2KdSmWJHJSyAubneNYYPwxmjUcwyfBIvFyuCceyFnra
 I7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Y7HBLwS7yJ8wmCRvvf7HPtdLby4aL5gss8oRmv4MR7c=;
 fh=zsY5CwBK0T3WdsqEDn6Z4LwYvB6bqVwHONPtumdVfuA=;
 b=RF179kHq7coxxrQUFFOuSDR9pbiONasbKn0u+oOuompBk6lL99/45hMOyPk04kcGpw
 ibv0iFD3yUe7EDl61IkqTwjE8dT/mj0nKA+AIPUVRWSP3eg0XcNley1fQqag2bseC4Vb
 X26jXoWieJ7U81T6GrKWlPwBjeexG5rochZ8lRy2NVVMLUDaOBACOPPx0mGBSZcbFxiL
 Q2VA1hXflEbDMdXi1hJ5pPZB2YtIK6AOR+NS2PP7wBouVrhMmjg85Uyqb/UuGGjerxu5
 ilUAIHP3leWq+04EgmuLZlIqvvwKJCcTf6yVKWcduF9Odfj+B7Rc7TNxL2hWZK1GMZN1
 8hOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1791898317; x=1792503117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Y7HBLwS7yJ8wmCRvvf7HPtdLby4aL5gss8oRmv4MR7c=;
 b=UmLt/b0elpi1gVrrokZuay1nGIXIKmzl4taEVB3vRMt43anBH3N7GHaeLFWkyCNxaA
 n3lAVdBF0DyccuG82MbNrO+kh/aHZSl9SaV0CAwDHLScbWqT44EvS4/AC9+gDK8ds61F
 1MKeGpcS3f+5Trutxem7dv9Xcb+dYfSKQ6R9jc74gbM5BSqzg+ubGGQD9haJMzxz5Vzn
 UfHJkvINOQ4sO35EC7Ihg3wj5Z6SsdhZdcQtVXkZsdd8n5bdF/MkHa+gZ6m9Sb8c/RtY
 uksRP9aDXjgEEHzU0hjOar6FVaVvBNI8UoDdRjPeab2fvdKWDYpQWKVnuk1cmNu2AU2a
 qLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791898317; x=1792503117;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Y7HBLwS7yJ8wmCRvvf7HPtdLby4aL5gss8oRmv4MR7c=;
 b=mPmLcFW4bPQ0wUXt8zDZQrJ6dYZIKZZyfeI38e1Dpzf8p8zzfqKzqUhwlXyOh7gqpy
 e17VHtHymWpN82nYa+OKRR2+FK6drDhURqyxjn9oaUiswH+3waGjCtctqBdwH5f3TaNx
 1OJpUqTrtxmKwT+0nZeMO9vXcsed9L8entwvAXQRExOW2IYutCaKEN8LjMg4oib4x4QO
 Mg5X6pzNWy1xaZbpr49mzO7sIRIqoWel9ruvCCcsJflYRa+Rd2RaqmbOAh7xBK8YxK4e
 dBmyOdwwULPmPdNc1FjdgPSxeW6nQJNjJ0ReN22rlsk0uLKHvqnbBUaRq/gd+dCSmRh2
 W8wQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEjf6o4AOqALAmagtpDLAgGjR3sjdr05loyzYrL2ugZj8Xrw/h0mdg6F+T9isDgY7P4xWs9kFIZg==@nongnu.org
X-Gm-Message-State: AFq9FYLfgi9WRh/aJ1dhqrbOU4B3j6BHPOfH9sYZBs1DM217ZZ0SwPTp
 tFPKqycs7Z4aHkV1BBfKOVyE3BqXpLyAalMiXWKnq0DaOxQkccoYafSh8ME5KnTejQLetkTZPmX
 27pEllTQRyDE6XhQHXHBy8sn68wLQUmw=
X-Gm-Gg: AYBFou2Atq8ruHjDkdqnoV00LHKjJDnzghDfQYGI1isEfp44QtIygSGe88wdfgA1gqz
 d1VGO5xMGiNlc9fnJxaxjty2rDR3Q7NH+WiQhXn7faLvXl0ksj63ukQoCBivQRGzfxgbdHuuIb/
 egcoAKGNA1U3EI2ChNfnCJ9zsSDL/8X3XmhP2ZQ1gW/+VBQiUYYBJrkIiI6Cdry7Sj8Dw73r7iO
 Bb2La0eL7FDArSrm3wIcy29fj6S8rHySGPxMlD2yl/1JYQ+y9BbnQVm55LsCOG6Rz5UAj8pQmLb
 ZE0rzo4fdo3Fa0CBffw5NsZGnEcEUJB+T6nKRUnSqEnSQ+At9e0qEASOyN5d8Kj6m4nxDIR21UX
 caMG/v772putSyaj5qb4WUA==
X-Received: by 2002:a05:690c:397:b0:8a9:9a2e:e33c with SMTP id
 00721157ae682-8b07ede3f88mr40575587b3.91.1791898317475; Tue, 13 Oct 2026
 06:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-7-2b21e63974f3@redhat.com>
In-Reply-To: <20260906-nohmp-next-v1-7-2b21e63974f3@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 13 Oct 2026 17:31:41 +0400
X-Gm-Features: AclHuK8Cnf-G9Va6AZGNY6r1ZZXLnnIksw884eaM6pr2qLn7dtcGAT47uSrfCjk
Message-ID: <CAJ+F1C+NLd2Nzmg1eLnH1La2yA1vw8dm7nEb2k93tcUCK4LzrA@mail.gmail.com>
Subject: Re: [PATCH 7/9] igvm: release found memory region on success
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi

On Sun, Sep 6, 2026 at 12:55=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Not only in error paths must the mrs.mr be released.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

ping

>  backends/igvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/backends/igvm.c b/backends/igvm.c
> index 7b7bdc72b75b..784a56504e77 100644
> --- a/backends/igvm.c
> +++ b/backends/igvm.c
> @@ -236,9 +236,9 @@ static void *qigvm_prepare_memory(QIgvm *ctx, uint64_=
t addr, uint64_t size,
>              return NULL;
>          }
>
> +        memory_region_unref(mrs.mr);
>          gpa_region_size =3D int128_make64(size);
>          if (int128_lt(mrs.size, gpa_region_size)) {
> -            memory_region_unref(mrs.mr);
>              error_setg(
>                  errp,
>                  "Processing of IGVM file failed: Could not prepare memor=
y "
>
> --
> 2.55.0.543.g5ebe2ebe4ea8
>
>

