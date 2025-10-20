Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579EBCCD199
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 12:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAp6G-00069q-Fr; Mon, 20 Oct 2025 08:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAp6F-00069S-0B
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:34:55 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vAp6B-0000Dv-3k
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 08:34:54 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-78378cb66d6so24670577b3.2
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760963688; x=1761568488; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ti09JlmrVOoi6F9mmuvbMaEYHC6q3mHj+MBsaiHpyok=;
 b=cy75YdmXAPT11cdAk1UeEhmxTkglM9od8qcN/Xe+koxrx2787J4/sjoepg7ywuYsNj
 XQJsOl0mw7UaHNCS43tblR9YFl8EadxPcT3G62pguguD1rHFOEtzuBedcpuCHneRYXg7
 r9O8nD5bu7x5DDmoOnERPgDTDIqPkiw+cxZbb9D0i4HtDjD6+IJNFb2vD+EGS60iFikG
 lPyucpY11fFzE3KVOJlUHbf0p0OeIPST4xC5OCnj/88ugGYUJaltZJsi70BOcpsa6HXb
 yuHZ1tOPUDbZ/+mAs2hU2C0im/U6IjS2U9Uphzgxo9MhC9hWmqCRUTCMJs+FQoSmz9Hx
 O3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760963688; x=1761568488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ti09JlmrVOoi6F9mmuvbMaEYHC6q3mHj+MBsaiHpyok=;
 b=epJgHyRJC47MlHfrBNKca1YxMI+FgVjsPi6FkMZFEn5FaO7VXarfXlz2gZAWLa9fHd
 gnUBUwjST5Cy8uphHfCM9gZzkAVm7/WWTAsKpmci1UgRos2yOmGP+qC8DBSZtSMKSmLn
 pZ77kgLGKCT9hnM6sl8fXWLpGPh0euPzniXBeOzq8X+HoyVug0VuSDdyjvw7lo5PUOZ6
 oPmBvoUjI/St/IVnIJ+RceBqthIp4wqtby4qT4RxlB/8iLoH8CIBCj9/OEXlqLllGYQ0
 fO9RkfxqlEooIiKeFBAS7KAemvmkaIbxjvOeFhRVATvA/hYQxfZwFLsFGrkETKLNpOlS
 L0mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHfj7hJjSa56q+bog3ulVE8RY590fKBWLdtEW1+/cL8VqhQS/1sINgJ37hcuUR8BR2e2Dh6EOciQ==@nongnu.org
X-Gm-Message-State: AOJu0YyvwKHA/2gvYaqb4YOxHmfwpLfsva+z0usHanFlfPCnRnPvo8IT
 YEDDNdN9cxdeMEMUiUxwDtx7iMwHKGMLZyqNAuLIGqgze5lQDKT95kJdb9NBBeZ+VTgA0e5CxVf
 MRHeS2i+XaQ1jU5hC8D0OLG04hGeK72z2BMmEF2zmbg==
X-Gm-Gg: ASbGnctrsXpSfFTvSqTVwazcodszNqxBOj6RxCwDfDS5yXK7uneEdzNeAccRc8ZoUPZ
 o/tUgAk0KwrkuPAwJuyb6HlYMHAo1qSaakSAsJ9wYmmKb0HHj6rX+XDTdavI0wMT8ns7VaPHQLm
 OhpsH++z+HJWh7SnK561E1r2JQnrIzLYUJ26538ts0SdFmM+8L+kIkJmtmYIyWCsKVd0o4W/1Dr
 EvhX2apfeaMpH/wfvct4CqVhlPosPVL+ZD79OVdxtOcsTapxK/xp24Hz/++ArWLAxEwSDKjpCZ7
 iIlKcD8=
X-Google-Smtp-Source: AGHT+IGcp17uK5fx3DVj4obHQSb9dnXxCTgp6N+Zq2D7RRkmTGxQHDAnFsEwdtC9FU9e3h8IBKDGto3x3YwEK9GMaq0=
X-Received: by 2002:a05:690e:1289:b0:63c:ec55:321d with SMTP id
 956f58d0204a3-63e15fdb808mr9062042d50.0.1760963688112; Mon, 20 Oct 2025
 05:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-13-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Oct 2025 13:34:36 +0100
X-Gm-Features: AS18NWDI2KCaFWq2XrxfBeh_s76Gx5w_p2dmMLhdon2cE-fT8tylNri6BYLj9fk
Message-ID: <CAFEAcA_trFRDSsot8JZBnspUvi2rTYze5obm9pAQj1597E3SBg@mail.gmail.com>
Subject: Re: [PATCH v2 12/37] target/arm: Put 128-bit sysregs into a separate
 list
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 14 Oct 2025 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Duplicate the cpreg_{indexes,values,array_len} array as
> cpreg128_{indexes,values,array_len}.  Similarly for
> cpreg_vmstate_{indexes,values,array_len}.
>
> Split the values between the two arrays during
> write_cpustate_to_list, write_list_to_cpustate,
> count_cpreg, and add_cpreg_to_list.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

