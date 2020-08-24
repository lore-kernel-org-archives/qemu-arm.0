Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2926344lfy;
        Mon, 24 Aug 2020 15:33:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOHHZkjhrCfSCvy4VUDnmVKtQpibcEXCr920A755f3RowAAqzIEPILBDt3gnC7BkPJn+qA
X-Received: by 2002:a25:bbc2:: with SMTP id c2mr10364523ybk.174.1598308434303;
        Mon, 24 Aug 2020 15:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598308434; cv=none;
        d=google.com; s=arc-20160816;
        b=wLqxMGpM1R+8T/a7sUYq79ZeKbuuqG9rS1g+467Yth0BEOZWYBPLPDzuuMcOcdnTha
         C/q/epb06IaTSQrwVnkD2R+1KaRbyXdlHtDZ44v7DjAvLau0MHsXUUEX3XdqLZ/B1UOw
         bwt7gNnF90sm+cD4PqHhkV1qKp7d+d2cOjStK0w2YC2t6/w51wQ3VF7mcX4hDitR73j4
         OqkRLPFEO7g5ALyAXuT3gS6EFR+MUC+5zEe6AYhqNiaD7DJT1+e0rn5ix1eBw2ZYsLzp
         67dQuhh5dmXPnbMWDFwApYfNemYa4GitnsJ0fxNI+Vv+AK23ClHVep/BOI/qdqGP2Otw
         7TGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jhFcywO6Y8wq+zavJ0ww+xgsP8QGx5ARX43YJfFEg8=;
        b=Nlszr1gvtafzSJ+P0q7wJVic9h8HCrf9fYp2RADT/vIePdRc0N03E6h3qWz2vsiF6n
         5tjGD92wO2H+Z3c6tFz/glZ4gdRkKkrL3jcuj10tYaBtLJCY/wVzC1tKwQCzblQ41yfO
         d6VZdX1g19nPURgdiivK1AP/O5KDqwqW/CP9mkwUba0ZYtyuMc3ZzA4zo7mvuim0npKb
         p9+DaZwO2ACjvcOrhSwps3UAy/FBCQke+7NOH2Ay8pHRT7Yun/DAmkUGrM08j/kPHvze
         QXq412UaD4tsjoH2kL0EWqD4TDNAYgKhgb39dPipcpDWFmaSERdPzUvem3wWU2WsVXgN
         N7Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PWTVQjo8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si13018489ybf.298.2020.08.24.15.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PWTVQjo8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAL2H-0007YB-Kj
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kAL0K-0005Rc-5A; Mon, 24 Aug 2020 18:31:52 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:34958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kAL0I-0003cT-8k; Mon, 24 Aug 2020 18:31:51 -0400
Received: by mail-il1-x142.google.com with SMTP id q14so8753976ilm.2;
 Mon, 24 Aug 2020 15:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6jhFcywO6Y8wq+zavJ0ww+xgsP8QGx5ARX43YJfFEg8=;
 b=PWTVQjo8JS5hJJXTGXcruPf8jjMrKL75jlMnFZVN/YcqkzkEa3mu7MLCwsMOZsaQdy
 y6q0LEMTMdW6/ow9+qy7ildRTuNoXQQkGvTCNPc88rzbk+CImxAPNvvjSp5TZmDsqc8T
 exmXJmujwN7bftkIq6bUisEmdkdGE5ls0e4lnwps1ViNrgQS80C0Muxsh9eOEKf7EDj9
 4PVhxxIn2zQocoLwqYr8z5rQGUjLMn6ATaCw9HZ8uxa05zjpziuPQgekBWHCVj7ZQlZs
 Xa9LbhGZ61p2GvyIlwPXQTkYxa2XaPuGzkuFCX1RPquSS5dTqRZdHtbosI1q09jPz2Dn
 qh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6jhFcywO6Y8wq+zavJ0ww+xgsP8QGx5ARX43YJfFEg8=;
 b=S27ZY7d/br/HSspnKe865au7F3Z7rXJOMeRQSXEV02jrBzbb7pV6MLJL1X3F3Vxfos
 0wyftO0FIRZmIT8ZeJLkekFOkiq4L1JWScFIGRc78UX9nvn0fslpM68igu8AbaVOfi0a
 1kQojm4ffUFqApq/j9oJRo+U0y0cnrsecEEQqs5QcIXeliUnlnoLk5Y20LLhJ09ImRHs
 K347Xz5DfJ92MUytgk4CpPU6i2Oc2IWhC7pmN3tf3ayy7n2NxuJ7ArB9wm4jJDGmtaVT
 xoCaG6y+tNvSENKT2JWwaDXWWhMkovN24Pca9YAM+SKwWf2ommxBh3fb61b5gY/YREvA
 vwqQ==
X-Gm-Message-State: AOAM530kFjt4wuufFJrSkvUk91AmGimBCiWhJ2J1G5ktoaPTZEwy52xr
 ZvCsTbZ9jZjavhwJ4bhxEwWwA8vbfooQjqmgQLQ=
X-Received: by 2002:a92:9117:: with SMTP id t23mr7220673ild.177.1598308308419; 
 Mon, 24 Aug 2020 15:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200824215936.2961951-1-ehabkost@redhat.com>
 <20200824215936.2961951-5-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-5-ehabkost@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Aug 2020 15:21:07 -0700
Message-ID: <CAKmqyKMeO96oAoKWFqV-TtN8HGnnfGKaNu4j4gE4HWcFuxgZBA@mail.gmail.com>
Subject: Re: [PATCH 4/6] xilinx_axienet: Use typedef name for instance_size
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BX7T334VTYyC

On Mon, Aug 24, 2020 at 3:02 PM Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> This makes the code consistent with the rest of QOM code in QEMU,
> and will make automated conversion to type declaration macros
> simpler.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/net/xilinx_axienet.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index 1e48eb70c9..ceb4652938 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -1069,7 +1069,7 @@ static const TypeInfo xilinx_enet_info = {
>  static const TypeInfo xilinx_enet_data_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_DATA_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
>      .class_init    = xilinx_enet_data_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SLAVE },
> @@ -1080,7 +1080,7 @@ static const TypeInfo xilinx_enet_data_stream_info = {
>  static const TypeInfo xilinx_enet_control_stream_info = {
>      .name          = TYPE_XILINX_AXI_ENET_CONTROL_STREAM,
>      .parent        = TYPE_OBJECT,
> -    .instance_size = sizeof(struct XilinxAXIEnetStreamSlave),
> +    .instance_size = sizeof(XilinxAXIEnetStreamSlave),
>      .class_init    = xilinx_enet_control_stream_class_init,
>      .interfaces = (InterfaceInfo[]) {
>              { TYPE_STREAM_SLAVE },
> --
> 2.26.2
>
>
