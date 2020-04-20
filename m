Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4229635lfm;
        Mon, 20 Apr 2020 12:52:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypJa08U1NN0F0gz6vR2/zTenAw/lSVegKwdhai3gSsJL8M/uJiuBD9h1X+bb3LsR9/pc19+s
X-Received: by 2002:a0c:b661:: with SMTP id q33mr16359744qvf.190.1587412369246;
        Mon, 20 Apr 2020 12:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587412369; cv=none;
        d=google.com; s=arc-20160816;
        b=M1HUpthBfroKRq2zZNNrW2ScwFaZN7Siy4Ay5r4npnMEqPmO99Nh9ORk9F0CINpvia
         UIa1dX3Dy/1eKqHnY0wDEPgDrZoS670kjgpCOXyOTgidXjSFmneRnWHU3stKQOdfae2c
         +6BRnbn5dAn7TcP9tlVx2uk2SZKg2x82YgruMK9ojEVGbBpVgjepGK5cxN+nXsI8cDo+
         Tb94XmmN77KEzw97QcCcjIKfTR5WTKITzEOlU2NsIdI2Vg5Cl4cqRjmDn01RJnP7vAbv
         NExqFU+dnaymbj1kKof1Wxwggg/a3tJ0K3mKdehFNXSF5dISAloJ7B3nqprxQLGuUSiI
         EShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NrxkcGoSw9f+9arw0MSGats/+AxX6hWZ0202mDIbBpU=;
        b=zfR1hRykEC23tC8TWX2M9mDmIJzEXoUDogzWPnxnH6G2j/ymP3fylfYeoeImeJpTch
         1761XoYgoogbwd9HnMEduBJQN+Ql6LVu+L8hdm44sR2r92gaJmq5ZKZ/wK7dH6tdxMB2
         W6FzyL+2Q6IiDOlVVGt6UHEIP111K5xm7yIe0EtS4OW7Flb0v69Ut9ByQ7V4NRG4n1qd
         3vBbZ14dcZRZ6kFbtGIBGfKpN/uNXoIENP57v36u/AgIAPpYcudk+q3vEMEVY1lkt4K1
         Od0XkKfpx81PlSjRafshH+NR2hxfeP5RvroeRH+UXpKBeQc2hYDjOV5K2bmdQxXvSmJF
         j5Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WuTm4AHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23si133695qtp.346.2020.04.20.12.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 12:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WuTm4AHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQcTI-0007iu-Kh
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 15:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jQcT5-0007hV-L9
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 15:52:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jQcT4-00039B-Uj
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 15:52:35 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:33354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jQcT1-00032T-CE; Mon, 20 Apr 2020 15:52:31 -0400
Received: by mail-il1-x141.google.com with SMTP id q10so9790980ile.0;
 Mon, 20 Apr 2020 12:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NrxkcGoSw9f+9arw0MSGats/+AxX6hWZ0202mDIbBpU=;
 b=WuTm4AHFFid/BeHOBLnqSfe25/iZSVybNlLERABFND5z1PDXkX3HJb44iqmL6R86++
 pOkePpjGwc6YUwdu3plrfSbmmSQ5jU84nYs9Xft+3yDASt7EmaGADKUrCkl3b/SZXGPM
 7jKDk2LuiymsLYlG+p+V8luaskrJLVcJFNvb+JPOrZoRISSY30WtSVOn8cNbGaaW9Ga8
 17GE+djKzm7qwwAkMRZYLGmEG0QAH+DEDIcpcFRbOkJVB6yNC6ZhcKRe3LqZ4PN9try9
 rSmEapfCjzNMKF4SyMTQjawnCYBT2Z9l/MKJE+z3i6zTi5JUhKMvCyYrAhHvv5Fx1pu+
 h56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NrxkcGoSw9f+9arw0MSGats/+AxX6hWZ0202mDIbBpU=;
 b=U5OtKc2PjCa85YDZypnJtd+YKWscvoJCukrxvRXDJiu96Vh5se24L6UlZ7CXJrNqST
 ZxbQ3aJ0hNg3RcMKNZB2gjgVFia3kMsGKWpkGw/71Waays2mjIav1KafpZfS4zP888Cl
 JEHQrQiK4nulVcCAIIX8bXYe7Kir67RL6YWWaf+bsqHR0p4eZje7yW3wJSDiBrWqTLvz
 lmbf2G34xW1AAjNLltgmAE38rUoMftIRGghnY8MifeJFpx2NE1WuT06iunANjkxhImBa
 mQgmM/u7243/FbMYfzSZ3oUmUQCasnajQgn2zysh5Yr2A/bbb7A5IWYH/uCkyzBxrXMj
 Ym3Q==
X-Gm-Message-State: AGi0PuZ7LIKLee63Y5acL0a1/Ra1Qx6ApPS4zMLtP6xGcHMFTNFB4cLY
 uJk2SdF4SL4nn5dJtZm5TFDoQn8y8ezQXqKPXwV65q1D
X-Received: by 2002:a92:d0c6:: with SMTP id y6mr18619565ila.227.1587412349988; 
 Mon, 20 Apr 2020 12:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200419162727.19148-1-edgar.iglesias@gmail.com>
 <20200419162727.19148-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200419162727.19148-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Apr 2020 12:44:02 -0700
Message-ID: <CAKmqyKM7jyX538LdZT2dEznxLKwaVpGHCuhNtwuJxFJLtzOueg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] device_tree: Allow name wildcards in
 qemu_fdt_node_path()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::141
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1O2+fWV1z6n2

On Sun, Apr 19, 2020 at 9:27 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Allow name wildcards in qemu_fdt_node_path(). This is useful
> to find all nodes with a given compatibility string.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  device_tree.c                | 2 +-
>  include/sysemu/device_tree.h | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/device_tree.c b/device_tree.c
> index bba6cc2164..f5b4699aed 100644
> --- a/device_tree.c
> +++ b/device_tree.c
> @@ -308,7 +308,7 @@ char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>              offset = len;
>              break;
>          }
> -        if (!strcmp(iter_name, name)) {
> +        if (!name || !strcmp(iter_name, name)) {
>              char *path;
>
>              path = g_malloc(path_len);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index c16fd69bc0..7c53ef7634 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -39,6 +39,9 @@ void *load_device_tree_from_sysfs(void);
>   * NULL. If there is no error but no matching node was found, the
>   * returned array contains a single element equal to NULL. If an error
>   * was encountered when parsing the blob, the function returns NULL
> + *
> + * @name may be NULL to wildcard names and only match compatibility
> + * strings.
>   */
>  char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
>                            Error **errp);
> --
> 2.20.1
>
>
