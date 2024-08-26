Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp886258njb;
        Sun, 25 Aug 2024 17:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAiCshgX1Dap7yCyIgA/A8aZnu4sbI9yZazh5FhedMCo7RqkSaiZ90+MN/6HYUU5nREu8QSGTQhh6UuA==@linaro.org
X-Google-Smtp-Source: AGHT+IHM8XD8l7s+c0kGOjzMIhmMApWEoCH/IG+/cnuL4MiXdfnHzjLYTa2yykd0wAvBoD5DjtBr
X-Received: by 2002:a05:6830:3590:b0:709:674:6e4 with SMTP id 46e09a7af769-70e0eb42c27mr11434538a34.19.1724630700269;
        Sun, 25 Aug 2024 17:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724630700; cv=none;
        d=google.com; s=arc-20160816;
        b=UO2Nq5CdOI1Jy+zsAKnQSiay23Qu6HnumcHdbQCkxWNvOTpKB3YcOnkw6QLsHQzibQ
         JL7FJ4n1NbJsxmy3muGs4bo9yEwfZhSnMhhZvrYqQLrGCDbgOuDsDCiFa2V0EigwJQNu
         cIs95SM+U5avOBWRPOdmuI8AlGOZb4wD1eGkreqhs5MDMpmAGDj1WB4SMqxb+HpEpCQl
         maQqnvvUt6aOHzMBfF77ztInbnWoIeiYFINtNNtpBdTl7n+AZxgiYc+0WKIpZRQjvUJK
         886PFhbkcTyoIByjBGARlhwmpc40hDTrNWojtG2yRnEYX7L+7wR81IyVWA8XEhXX3+3+
         pCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gkMhbC19yCOFNZeuNX3ed8+D7YUplpgQhn1n0ajPVj8=;
        fh=uWJTShR+Dd0LC34y3mwUlz4ppy9WVdJec5RWGbkvRw4=;
        b=w1nG0+R5C+BwUljQFaxF2dlXGU4NrmwyUd/jAav6MKWlmID+hO6TcjQ+DLZFYJonjQ
         ylTRw5NjBqXB7MrUOeyfrlmbpNzXMBM0SJzdGn3IRHFgT7aS1Bl6N9N+HLUz4qteyN5/
         0VgU1bLsr9+lGTfqTuzWabqsuVJdjxi5BJ4auHW3FOe+gmhSx43zwu9MbQX7zIKMPxBY
         JoO46ZLdLfbUw7TN5/Z9yyLY66z0LLFIL+KI7DY6WjjX81NFnok6qSmUYeQodxHEmpok
         vgIEIIRKAUg7GoWOW1h5Uxu3f/qZbQNRXbFF515rSOE+Quuak210kr4OMsr9yuOysMuk
         upLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxtMgesM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe348023si94358471cf.786.2024.08.25.17.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2024 17:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RxtMgesM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siNDo-0000JP-8d; Sun, 25 Aug 2024 20:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1siNDn-0000Hz-9U; Sun, 25 Aug 2024 20:04:35 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1siNDl-0000dy-BC; Sun, 25 Aug 2024 20:04:35 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f43de7ad5eso44872841fa.1; 
 Sun, 25 Aug 2024 17:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724630669; x=1725235469; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkMhbC19yCOFNZeuNX3ed8+D7YUplpgQhn1n0ajPVj8=;
 b=RxtMgesMpIxZO5sG+t6YpJlxIylSh50SNdi19x+IBRWqKWXG5QCdkOF9P7blzi2lN2
 96KBoAjwr5DQimSopUeBM5d9zmmQUkv5DeCbtCuV6vuiRlwDxgB7anmveEaeZo7Hs5Pk
 qJjhZ29Im2DxUP45SSZVXNwNz6SGAJ9oEJ6wh6l1aaJRkGZtnXB62lT9hBm7jzRCSAJZ
 RkZ1JDa6Q+okza5QgMi86nQfOKH6qXBP3rNfnjxeeZk02ZufqwB6hNkhua9vPw/CZxEr
 FVxa93FDuzyoQTZcn8/sTgUwS7ab0DnPtYRJ1DXTiOga4Q0aLV4EqIgRsxcNOkfdHyyM
 hthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724630669; x=1725235469;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkMhbC19yCOFNZeuNX3ed8+D7YUplpgQhn1n0ajPVj8=;
 b=mxMw8lgzBppHgNzo5H8yEBaoy+uruPqhxNlylytw5Jr1AvBJUKDCfyZ5nGNb9Vx0M6
 3N55bwPTSYXNkK0BodjdhaST9UjtRNEPIzk9AcP6Ai5DrlkEtjrMS6ch8YwrpX+hjxds
 SawJkWoefw2gq8zfKLuTgf7JQ8Rbe0DIZVrvO3/BQH3nEt48RktImrBOsbKko4cyW0oQ
 86oJDI/cA03mbd6TRWpgzs9jLI8HQLzlq4Nq74sTKHUewOY0+nUrjhcJbmxgmbSgJv6d
 6PII5YPpRAaQ/84jIgpflfhicFnY80IaIPmMGWxMs1m98XjfQg5Rfv/bynWw0LAkWtRu
 WjqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMfIGeouLobccjYhWXFKA7M9obHM/emimuxCib5a6S6T6PTITPXfXKpSxkStwIfddy7tC/hIgKnErV@nongnu.org
X-Gm-Message-State: AOJu0Yy+URuhIJ8BaXZTorUwdBMmBm2OSrRjBTQLMvwRg0gDl+3fnLPD
 GkcgQYkOAax4SM2lSgcuOis3DwwmbDh6+s0IlldpPiv7dA4KFwCNwWi7UCW21PoGZfBZ5BfUngL
 kC35p/4GTSK4ambI3OduDECAcy2o=
X-Received: by 2002:a05:651c:b1f:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f4f48d605dmr58267671fa.7.1724630668136; Sun, 25 Aug 2024
 17:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240822162127.705879-1-peter.maydell@linaro.org>
 <20240822162127.705879-2-peter.maydell@linaro.org>
In-Reply-To: <20240822162127.705879-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Aug 2024 10:04:00 +1000
Message-ID: <CAKmqyKMheHovDg34ffejkC3BzL1cVLMvtDHufSuLc_AvFVhrnw@mail.gmail.com>
Subject: Re: [PATCH for-9.2 1/6] hw/misc/xlnx-versal-cfu: destroy fifo in
 finalize
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=alistair23@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KsQ/WoJjlJFm

On Fri, Aug 23, 2024 at 2:22=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> Since the TYPE_XNLX_VERSAL_CFU_FDRO device creates a FIFO in its
> instance_init method, we must destroy the FIFO in instance_finalize
> to avoid a memory leak for the QOM introspection
> "instantiate-examine-finalize" cycle:
>
> Direct leak of 8192 byte(s) in 1 object(s) allocated from:
>     #0 0x55ec89eae7ee in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/asan/qemu-system-aarch64+0x294d7ee) (BuildId: 6d508874816cc47d17c8=
dd775e8f809ae520e8cb)
>     #1 0x7f697018f738 in g_malloc debian/build/deb/../../../glib/gmem.c:1=
28:13
>     #2 0x55ec8d98d98d in fifo8_create util/fifo8.c:27:18
>     #3 0x55ec8aa2a624 in fifo32_create /mnt/nvmedisk/linaro/qemu-from-lap=
top/qemu/include/qemu/fifo32.h:35:5
>     #4 0x55ec8aa2a33c in cfu_fdro_init hw/misc/xlnx-versal-cfu.c:397:5
>     #5 0x55ec8ce75da1 in object_init_with_type qom/object.c:420:9
>     #6 0x55ec8ce5d07b in object_initialize_with_type qom/object.c:562:5
>     #7 0x55ec8ce5e91d in object_new_with_type qom/object.c:782:5
>     #8 0x55ec8ce5e9f1 in object_new qom/object.c:797:12
>     #9 0x55ec8d65c81d in qmp_device_list_properties qom/qom-qmp-cmds.c:14=
4:11
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/xlnx-versal-cfu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/misc/xlnx-versal-cfu.c b/hw/misc/xlnx-versal-cfu.c
> index 6bb82e51c15..2284b407eab 100644
> --- a/hw/misc/xlnx-versal-cfu.c
> +++ b/hw/misc/xlnx-versal-cfu.c
> @@ -397,6 +397,13 @@ static void cfu_fdro_init(Object *obj)
>      fifo32_create(&s->fdro_data, 8 * KiB / sizeof(uint32_t));
>  }
>
> +static void cfu_fdro_finalize(Object *obj)
> +{
> +    XlnxVersalCFUFDRO *s =3D XLNX_VERSAL_CFU_FDRO(obj);
> +
> +    fifo32_destroy(&s->fdro_data);
> +}
> +
>  static void cfu_fdro_reset_enter(Object *obj, ResetType type)
>  {
>      XlnxVersalCFUFDRO *s =3D XLNX_VERSAL_CFU_FDRO(obj);
> @@ -539,6 +546,7 @@ static const TypeInfo cfu_fdro_info =3D {
>      .instance_size =3D sizeof(XlnxVersalCFUFDRO),
>      .class_init    =3D cfu_fdro_class_init,
>      .instance_init =3D cfu_fdro_init,
> +    .instance_finalize =3D cfu_fdro_finalize,
>      .interfaces =3D (InterfaceInfo[]) {
>          { TYPE_XLNX_CFI_IF },
>          { }
> --
> 2.34.1
>
>
