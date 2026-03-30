Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FEDFB3CF5
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 10:13:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w79cS-0004x4-Cc; Mon, 30 Mar 2026 06:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w79cP-0004vY-3w
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 06:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w79cN-0003Hr-P8
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 06:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774865591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LA0ZDZS7OsMnBwWlkhq27STqYWfDwqgl+NEJ6H+mZOk=;
 b=SsfEvRKWUwuNFcCllzvUOWSJU+gNMT6DJWbVZcmT/snwX1aUF3rth6PwY+ptmdlw3TitaO
 bb3EoFHrdOF2wCcQBE0rrhr5I6qAQbhNpi9Ugo8CtpXXI4sbfagzMZ6atuodUASAO4EuVn
 a1fjZkSB+HB6aSBoil5TbsnwsR9H9bo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416--KaxAqnANCWOznz5VBOOCQ-1; Mon, 30 Mar 2026 06:13:09 -0400
X-MC-Unique: -KaxAqnANCWOznz5VBOOCQ-1
X-Mimecast-MFC-AGG-ID: -KaxAqnANCWOznz5VBOOCQ_1774865589
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43b4dcdb372so3786466f8f.0
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 03:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774865588; x=1775470388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LA0ZDZS7OsMnBwWlkhq27STqYWfDwqgl+NEJ6H+mZOk=;
 b=bJia7ofjDkAQUUTIFWncgBSKpkVsuZPkdpZQ7YfIqgnd6MG9aWMUgj58pyYUkMYKVG
 YFhculSyxJuN0w2eA5//xzCBYj3o63kFmWNwn+Xc4rjwTP54SqnPpvns+BVX6w1Dgk10
 g3eg3xehT8dQc0UPDKslI7u8Ok5IPdOqTtvSbcLl3F8qxauwfO0EvIqyCOuUepk5sixW
 Adq7RIwB0KnZgiE8hiNfLHAjoDr8FhYQQ53nfDkdFhttxKBhG4KLxQD8mhmxDx9UH6MQ
 auFFd1pbLWByeV0uUkqsWt8cWXvGQPZwR6OQRo/J4cYf8vmn9jU4VK6dmzfN68aenjsC
 cZNQ==
X-Gm-Message-State: AOJu0YwoZ1zlyMzAfw1yziV5xtVnm8vHqtvx4HbB08uH4OVCQAUaZxHQ
 M4JpMnmUxNTtO9EyRsNZ6r1yfPzoV7EK36CHAPr9RGBSvUyWiErtWJB/AY/QZdOlIYqdQ/9/+5W
 TAaCkg3eQkLcDtocPoKfZIq6nMHPpQKaPVtICStquZRz4oc5qW4mdCrZ8ck/ljU5p8Mf4QJzMF8
 f4sg9wLI7RjAg8DZBor5RPzWxnRzHd
X-Gm-Gg: ATEYQzx3sSa/X0eWLXFIKZXtm+6Kt5J3W7NJfb8S7cYg+pN3ZdU0dw9ZgrGqpdAyLxw
 5sVhnNV48WDFkZrXBbY9u073X4hzEkLF+6bIA3DCZBk/+iKxMOjF1GYs9x/a4m74sYYXSu3v5mO
 vDGBJSXpm+X3ZxaBaeIe3YMuwzjzoRFr2SfKTfei3YxJHJsj4YI8rMvU+pNDmBiahB3pB4uaLDT
 ms9qmf+OyVajD/jQZNBwHnwuXZ0aFkrrn6INEyhfddslgFhgtRvNaBOiC8sv2J7f0lERsj6oV6z
 V8Z6
X-Received: by 2002:a5d:584b:0:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43b9ea4acdfmr19432574f8f.25.1774865588562; 
 Mon, 30 Mar 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a5d:584b:0:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43b9ea4acdfmr19432525f8f.25.1774865588071; Mon, 30 Mar 2026
 03:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260327145012.907264-1-peter.maydell@linaro.org>
 <f31d3ba2-b843-4322-aa8e-2c5a1cd76fdf@redhat.com>
 <CAFEAcA8UQsrFo3nQRN_3F6CAKQGWCgv1AsEP7w8FD5-EWDh8rg@mail.gmail.com>
In-Reply-To: <CAFEAcA8UQsrFo3nQRN_3F6CAKQGWCgv1AsEP7w8FD5-EWDh8rg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Mar 2026 12:12:55 +0200
X-Gm-Features: AQROBzBR-96Sp3AhCSf4Wx6xHqGUpD4ew0_7X9DIw0JviR6KuU3niLuWwrIGrBA
Message-ID: <CABgObfbBuV0G8t0Ueq4xzhU5c0uBgXbbo_EpPZLyHtDp9=+dHw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Use strcasecmp to parse boot-mode
 option values
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Kostiantyn Kostiuk <kkostiuk@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H9nNSEePFxs7kXNp_uTVtQLZO6ksfZWrip3lchppI2w_1774865589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1, RCVD_IN_VALIDITY_RPBL_BLOCKED=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Mar 30, 2026 at 11:48=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
> OK, great. I'm going to do a pullreq before rc2, so I'll put
> this in there. Or if you're going to take Kostiantyn's series
> and send it out for rc2 then feel free to put this patch in
> there instead of the one that fixes up this file.

I wasn't planning to send his patches until after the release, since
alone they don't do much (they're not enough to allow the MSVC build
to complete).

Paolo


