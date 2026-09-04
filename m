Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063F5C624D3
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 14:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2V3e-0007jU-BL; Fri, 04 Sep 2026 10:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x2V3d-0007ir-2R
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 10:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1x2V3a-0000p7-44
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 10:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788532696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2S2IGDbSTnytqN/odEptApJDQpbUyn6mWZpgMBv0s4=;
 b=Wn6HpHYeKxiw2TRv2OYRe2Nc2C+8gIhv2al3613mvmBbXuXD31FDTr8A3MIzB8SSudZuKW
 DoBZbrCR9jdSFYTpWr6WhNG0lgj9H+PffhCCqTErVUTmRpef17zWtllTO3aEHn3O+yA6Lm
 uCdFI2A3qvnCyLPYMHqlgQmetwp/HU4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-F9is3G8xNRG52lzfxCw28w-1; Fri, 04 Sep 2026 10:38:14 -0400
X-MC-Unique: F9is3G8xNRG52lzfxCw28w-1
X-Mimecast-MFC-AGG-ID: F9is3G8xNRG52lzfxCw28w_1788532693
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4858f06e142so28607f8f.0
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 07:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788532693; x=1789137493;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=B2S2IGDbSTnytqN/odEptApJDQpbUyn6mWZpgMBv0s4=;
 b=YF6mwBrUvShm7k2NfPXPtR/Ytj/5l1rfb8gcTZ5/UZ/UjXCqKOEiuaZau2N5IlUYbh
 jnP98Dyu17qrYfqKTyGn5KCsyCl/IIxQBTcYxWQp9VYcmODNlQGViTCLVOzgBjjyrUVE
 uSAYrNybtEcpa+88fDHTzGTuxJRB/Gyg4U7veErpX86u4RM6v3ZRV5pbXGmTcPysSxqK
 Ck3jmzqaPc9pjSisPNrJ5ROPhEMGnFUqDd3K4KxVGVBc971Tkct8PK9mse+fSmcGh5ZI
 f1zIeNwk7O5+D5dDUtEfNweVtPjj3VAqIe7iehmfkLfS+h7v3u3KYHMOWymK1Egse+wc
 ZbFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzK7E2QwU1mN+gk/qwDnv/zKBhdPioA3oMbML0+CYdjw6UupOSuflWn0N88xlX1MFyVID76WozaQA==@nongnu.org
X-Gm-Message-State: AFuF++maYlU0lNl9wRCncs2F6dz2FluCNoC3Oar6L1W0KQ2bDC375ezw
 Iyjk7xa7p/rjN1DV6Azmd3eYuMTd7PNBghOB+Jc7Z/TaBp2rMXPybeqdjqtgkr6euzZu/p0S69y
 ts43FM0IUfd+H/HCXW5Eg0cJaoTBmbskVbUamNBxwJW0yr/aGXphLgQ==
X-Gm-Gg: AYBFou3JUHh6L0gUiXVxDPNAzB50nTMBz32wdR0lgBDfZe8wHMc+t2CokNr1MTiplMk
 7FPRCk826M6SZzNZI5Yn6BN6+MHFK7z9dYOTsQi8/qsfr7YdNhX8Z1P8iMp9q70xq0pWAgohXuD
 BI6ctb6hAKOvm56vGMoo8wK/jesWeycXyOgxvKqXFDn7T96fYU/tGLgJK5ac1W6c7zeB5satLsd
 4uRCpptx5WFjsI0WGxTekhelbbB37FQHPvikMjHvV8K83vxRuIPLTJU7aHrIvA2Bmnqz8oeASob
 Pv5mjUxavRVhV8lB6Y9W0xCG93gG3LNvUznl7ZOqEkfMfxCt/wMrxL9Q1j1ysb1O5GY0q+4etKF
 6LRNdmjGRbclNRpmr3fX+loY=
X-Received: by 2002:a5d:5f47:0:b0:484:3a16:cc58 with SMTP id
 ffacd0b85a97d-4858707f11fmr7759063f8f.2.1788532692380; 
 Fri, 04 Sep 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a5d:5f47:0:b0:484:3a16:cc58 with SMTP id
 ffacd0b85a97d-4858707f11fmr7758935f8f.2.1788532691305; 
 Fri, 04 Sep 2026 07:38:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883953cfsm5770767f8f.13.2026.09.04.07.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 07:38:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:38:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 zhenwei pi <zhenwei.pi@linux.dev>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, devel@lists.libvirt.org,
 Fabiano Rosas <farosas@suse.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 7/8] docs: deprecate virtio-crypto
Message-ID: <20260904103743-mutt-send-email-mst@kernel.org>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
 <20260824-fixes-for-11-2-v2-7-352c6b890402@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20260824-fixes-for-11-2-v2-7-352c6b890402@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rIXa0OaH0AN8CBdZXGEQ_zPQRPuVPS3SxLiFoDQ3byc_1788532693
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Aug 24, 2026 at 04:24:54PM +0100, Alex Bennée wrote:
> We have outstanding guest exploitable bugs in the code which is fairly
> complex and needs some serious love to clean it up. As off-CPU
> cryptography acceleration seems to be waning in popularity lets just
> the deprecate the sub-system with a view to removing it in a couple of
> cycles.
> 
> We can also remove the backend code at that point as well.
> 
> Link: https://gitlab.com/qemu-project/qemu/-/work_items/3625
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I am assuming it will be merged with the rest of it?

> ---
> v2
>   - mention the backend bits (only used by virtio-crypto)
>   - use Gonglei's modified version of the text
> ---
>  docs/about/deprecated.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 0c656a968fc..05e4ce8cf16 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -276,6 +276,24 @@ future release. Where no 'dh-params.pem' file is provided, the DH
>  parameters will be automatically negotiated in accordance with
>  RFC7919.
>  
> +Devices
> +-------
> +
> +``virtio-crypto`` and cryptodev backends (since 11.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``virtio-crypto`` device emulation is quite complex code with a
> +number of known flaws. It has never been migratable, so it is
> +unlikely to be used in any serious virtualization setting. Modern
> +ISAs provide on-CPU cryptography instructions (e.g. AES-NI/VAES,
> +armv8 crypto extensions), and the Linux kernel deprecated AF_ALG
> +and dropped its off-CPU accelerator support in Linux 7.2, removing
> +the primary userspace path for off-CPU crypto acceleration. The
> +time for this sort of off-load has passed.
> +
> +As this is the only device that uses the cryptodev backends these will
> +be removed at the same time the ``virtio-crypto`` device is.
> +
>  Device options
>  --------------
>  
> 
> -- 
> 2.47.3


