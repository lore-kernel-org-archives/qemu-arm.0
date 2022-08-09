Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3117573ejf;
        Tue, 9 Aug 2022 06:13:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7znfzrJNkFkU8DpWDw+7JvbRUr31vwKvGhEKkwjSK8M5N5fO49NX9WIPXNWHahIxgdPuqy
X-Received: by 2002:a05:622a:100e:b0:342:fd69:e8c2 with SMTP id d14-20020a05622a100e00b00342fd69e8c2mr6404676qte.180.1660050804803;
        Tue, 09 Aug 2022 06:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660050804; cv=none;
        d=google.com; s=arc-20160816;
        b=ZM8CpalFfGqhpM+TqiJI2AjPcRGxNxVvWKg34lM7vBmekSOx1vdHhYFca+8CrlKdFT
         BOZLIlHYcitP+jcvTPXgE/LXyVe05h+lCVk+npoCJZHcTtXZfL07vTS/3Rr9pxeP6eMY
         Ml1OJWeYZfzlTIAgdWrXssSFMAgeoGcHTmj4S+LRZGdgxuvZDzrue4uhhsh4O6wf/vuq
         ist906d3mFMGXfM+BgnHHSfvH+FZ/1oHxXbqw5uCmqrSXcnpC/UmLKOuGy+5PQTTN4lA
         30aUKyrhSjKlBNFpiyJmM82KwK/frjpjeal0wsYPAsUr4eRJEW9/DpZtD8laAuxYq+VM
         WzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rfyfPwglwciXLLR8sWdzJP6xrPyKg3aLqgO210d0WV0=;
        b=txCT9TnvDy7WI9n0R7pXbOzuuzDpESmQpAwiyhJeyY4JIeHpuMUuORlOhAg4CoIj1J
         CK7cNXDUxPmH1u4Jv0JeeqV+qZr0h19RMTdyMjdJCZ7e6+L85tJQJQNFJHhf+qoYlmDm
         Wy9ZHZdcst+E+34Z2xgmAnVC77AfKud/x6yYW3K/xn8ogY0tResLgy7LvdjDyyxzBM1P
         iEDLcdjr7Lg8+h1Ew5LaFjuwjmAgrXUHPrnmcdiB8D6dNaDAgEIzp+/zAXF/8bh30MfM
         0S2t0C3C8+ZhVUYjPDVbcS9D2BZfonYEU08e0Nf12qa9Ug8/ARBOsf0yOm9rxvxCOkTz
         DtsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBw4IUt5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a05622a124c00b0031ef4ac10cesi2868735qtx.687.2022.08.09.06.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 06:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FBw4IUt5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLP2y-0000Ig-C0
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLP1y-000815-3d; Tue, 09 Aug 2022 09:12:22 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLP1w-0005kX-Hv; Tue, 09 Aug 2022 09:12:21 -0400
Received: by mail-vk1-xa32.google.com with SMTP id bj43so4753387vkb.4;
 Tue, 09 Aug 2022 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=rfyfPwglwciXLLR8sWdzJP6xrPyKg3aLqgO210d0WV0=;
 b=FBw4IUt5WJxENoQkmMp49X2Jn1bDo9+nEV9tXfreig+yRJpLMkkgz9Z5uIWX1NUGhh
 AgO4eVZkjHzE7y+uhNITIscji5A8Ox7R7xzB8aJMsi+DweIWi706+aqOPwa9TBLUHZFf
 cTtW7Z/JfnuErxSYEgo+66ZHDVT3qxj3brvXZZFKRgLoMC6VTOOVb7Knzl+YWV+6qUFb
 5hbF4YYvP5AJ6BhEvw8qFYz6OznRraYtTuzj3gkknttvLKWQD/AEdaElv3coBN8tQHy3
 Gkf2zM5VXO7KxOn9TQGaHkuKQJCsMqcj6NyKeP+lzgkFYigI2G/PFCRyjJSbZ4nDj9C6
 pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=rfyfPwglwciXLLR8sWdzJP6xrPyKg3aLqgO210d0WV0=;
 b=4jxvhUruQMJZU84nElF2Ge1UZ7CelFdfolc0z26PCtWatwDCTEIA3N0dcbkNYje9uz
 1Dq+GvHwY5xA0Bfa9N9yBtQ5kKsvMDUnQaqdZlaQodVrEWBFtb7MDC0jEXN8qnU8xbp9
 sdN/mzMG/BtVOTYErPvs3EkAfeVQff5DF2AHas+TTguYZ07iEUAZJcGjo0GHA7butKnd
 OBwrgdvYahzPHQn7fynQGkBpmulXuS03MkefX58lna8w8hPQ7i589pTD/qsjbHcgGQzy
 7WWPZdK9HoOw/Obs8CdRQ2dvEQ0q+FC/uuyVzH7wjR9fRpjz2kzwZKrQUkV36zvKMQBj
 cZ/g==
X-Gm-Message-State: ACgBeo3xe+RoRJmOIYAz6wxDvHE1971bNL1qlWY9g7Y3LNLCg+ZG+ydp
 48g9PDIdgEUhv3wKMSBnq1I57gvF0W/Iq2hZsc4=
X-Received: by 2002:a1f:a7c4:0:b0:375:52b4:8249 with SMTP id
 q187-20020a1fa7c4000000b0037552b48249mr9636797vke.31.1660050739152; Tue, 09
 Aug 2022 06:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
From: Bobo WL <lmw.bobo@gmail.com>
Date: Tue, 9 Aug 2022 21:12:05 +0800
Message-ID: <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
Subject: Re: [BUG] cxl can not create region
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-cxl@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=lmw.bobo@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: MPcTje6+fBdz

Hi Dan,

Thanks for your reply!

On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> What is the output of:
>
>     cxl list -MDTu -d decoder0.0
>
> ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> at least not in the specified order, or that validation check is broken.

Command "cxl list -MDTu -d decoder0.0" output:

[
  {
    "memdevs":[
      {
        "memdev":"mem2",
        "pmem_size":"256.00 MiB (268.44 MB)",
        "ram_size":0,
        "serial":"0",
        "host":"0000:11:00.0"
      },
      {
        "memdev":"mem1",
        "pmem_size":"256.00 MiB (268.44 MB)",
        "ram_size":0,
        "serial":"0",
        "host":"0000:10:00.0"
      },
      {
        "memdev":"mem0",
        "pmem_size":"256.00 MiB (268.44 MB)",
        "ram_size":0,
        "serial":"0",
        "host":"0000:0f:00.0"
      },
      {
        "memdev":"mem3",
        "pmem_size":"256.00 MiB (268.44 MB)",
        "ram_size":0,
        "serial":"0",
        "host":"0000:12:00.0"
      }
    ]
  },
  {
    "root decoders":[
      {
        "decoder":"decoder0.0",
        "resource":"0x10000000000",
        "size":"4.00 GiB (4.29 GB)",
        "pmem_capable":true,
        "volatile_capable":true,
        "accelmem_capable":true,
        "nr_targets":1,
        "targets":[
          {
            "target":"ACPI0016:01",
            "alias":"pci0000:0c",
            "position":0,
            "id":"0xc"
          }
        ]
      }
    ]
  }
]
