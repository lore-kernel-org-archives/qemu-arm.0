Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3037890lft;
        Tue, 28 Jun 2022 02:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tb3HaWLvpvuCLBCqoUGnqgt16fJR/Ww3AwBqW7FgRYCFrZ4W4jZEu6YhKfb0XSyO8ywGwT
X-Received: by 2002:a37:a488:0:b0:6af:4bb:fea9 with SMTP id n130-20020a37a488000000b006af04bbfea9mr10661310qke.380.1656408253310;
        Tue, 28 Jun 2022 02:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656408253; cv=none;
        d=google.com; s=arc-20160816;
        b=tSDvHecaFe4uF+nVunBA3F0NQhjfXJquGFCq8FFIFZbiWmuVy8grBZz9WcwVE9TGor
         kpeLcVNTE13V3XKfz5gsAaFv4kJhrg7WptSDHSyrscv8h3Y87CQfK3EDIoBg6MZJxY9f
         n+mcU7xmgSkMOvZi3gd+ydt+xtFe1a46z0T59KkUfXxF/zB0wjS90r5uOfm/bnJOR5Ca
         AV2WjMc47VSQcpAztXCQ/CbPCg9R7+n0HUzQbBL+TFlx47TCA2FUnlVMSIq3olW7EImU
         0nJZSh8wcPNaeLFVU0UOhmsM416eH4CnGH3eWtgMR8DnsN+5zCLd1fIBWaRpL9HC0Aqa
         2EqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Rri3iEX0NiurHhAQVuy3Pvvl85a1f3zt2cLEOi7oKWg=;
        b=PYcaYiUMeaG6B0r8gCOSqP342URFJF/Yh2wtYK5WtXxLoGD0NQB+pqgI0O8j+SVKdv
         pUSYxUzNG1p2mruigfE/u5z/+hNRA2Rv0gcgOrZ6CPkpmPzrggmc1v46rcBqEb9YsHqe
         vpi5HNqNCqe5GBDdK3Hagc19jKuHT0cQTraQfrqNJjUUdxKry1J9wl0fZsVVXs6HEdXa
         ehlOhiFbXjfvSOLt1NSLDUumIgObzK0GyzDXfVNLUIBvI1J4dxJJXm3vqXGvsGKsN++X
         GQ6HED8dyApNOaCP2G73jqrt7VcmRSfqCOk4HK6vAcUFKAU6A1cqggJz7H5OCKLp78Z/
         I6dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19-20020a05622a029300b00306aafcfd6csi7700088qtw.580.2022.06.28.02.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 02:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o67S8-0000rz-QL
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67C8-0006nE-QK; Tue, 28 Jun 2022 05:07:40 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67C6-0002V3-Sh; Tue, 28 Jun 2022 05:07:40 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MdeX1-1nX3UM3OkL-00ZeAa; Tue, 28 Jun 2022 11:07:28 +0200
Message-ID: <a350c66e-a498-db4c-997f-7720d390c4ee@vivier.eu>
Date: Tue, 28 Jun 2022 11:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] trivial typos: namesapce
Content-Language: fr
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru
Cc: danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, kbusch@kernel.org, its@irrelevant.dk
References: <20220614104045.85728-1-dgilbert@redhat.com>
 <20220614104045.85728-3-dgilbert@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220614104045.85728-3-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wBNNISN9KGAMDcSN3hE618qGZwpFWIcvrL/z1x8HFOxxpgThe3B
 KcyH/M/phkqhyAGbJDZgurCzB5bopKczoA/ngxLHiRl3J46t9lza1ZnZYxyAQdcJ+FGdyHF
 oN/dG9ZGW+3yfMgEDkzzPPy2IV4ApJPqlDX2UviyIswUNwWNIIL5xJOZTTbFQ07Mc9oSa1b
 G7RoovD6qdGag32GLrREQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4pJghs4IomI=:GpE2+CQLPkdtg+lnBkZ58X
 6CMt1R/7Crn2NJK2dVlJ5FZ+ogpRPJ19lsIPWpZL6+snBrv0BdiM7yXwNmcXkTMs/t17sCZqp
 +GxvOVUmdw9FoqWCo1cnZ4cFQC4OaO21+T3aRItBzRHqDuEyR6LVDkVqoehi9TkV2nHwxm0w6
 2j2kgp0SuRmB+hHIQWU1/7aHMkAahJ3uCqljgykrUwBakKx0dtQPKUM5wZzcZ9eUiz581fBpK
 ozzAYvAgM8BSWoYJDEMkkbNu9NUzDOVF5I6BcotkWma2s9BHHikfieJSRpgcsBfcCou6PdPM1
 5SCzt1qZePwsjGArDQHICeoKwYbcO4hcukRI0BOps9/nAY0XHrJImHUqHZfXK9MnbbYGLSb4t
 0LEbbmLds58duzKNGRQCKfg43N4j0Y5rhKOS9/5HdzsDYhtqvpBvcKKt6ifzqO+OMacdQVXXK
 7Is4MvJ2Lz0AcE9cUqnIkm8oEi3ozKNO7Geiwi/5bByc8fVYZj68BkM2c5FgKwbWQIKHod5bX
 erZ6R/J0n/2EWMoGhpFMPB528NElcddSFnHpeQ2KiiFHsZa/I4otMKsE6jDe+1VcPGJERYFf0
 VJIXkOyzqVcmBelU+7NKgMuIiz75X6NHi0jxVtkOuqRMYix18GoTJC/hRVIANbdozlHnsywLQ
 aWl71xDiAf7b4ocVhoQiM5drdUiVqeFfx+xnoENujJSDhu3XhHucUQlS1rqIZBD71QUsImVZX
 b1KlZ+/AIHVviw1enbKLV9YPRUIoVQm1FcEF0Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-TUID: yBi2xWw5LW7z

Le 14/06/2022 à 12:40, Dr. David Alan Gilbert (git) a écrit :
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> 'namespace' is misspelled in a bunch of places.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hw/9pfs/9p-xattr-user.c | 8 ++++----
>   hw/acpi/nvdimm.c        | 2 +-
>   hw/nvme/ctrl.c          | 2 +-
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/9pfs/9p-xattr-user.c b/hw/9pfs/9p-xattr-user.c
> index f2ae9582e6..535677ed60 100644
> --- a/hw/9pfs/9p-xattr-user.c
> +++ b/hw/9pfs/9p-xattr-user.c
> @@ -27,7 +27,7 @@ static ssize_t mp_user_getxattr(FsContext *ctx, const char *path,
>   {
>       if (strncmp(name, "user.virtfs.", 12) == 0) {
>           /*
> -         * Don't allow fetch of user.virtfs namesapce
> +         * Don't allow fetch of user.virtfs namespace
>            * in case of mapped security
>            */
>           errno = ENOATTR;
> @@ -49,7 +49,7 @@ static ssize_t mp_user_listxattr(FsContext *ctx, const char *path,
>               name_size -= 12;
>           } else {
>               /*
> -             * Don't allow fetch of user.virtfs namesapce
> +             * Don't allow fetch of user.virtfs namespace
>                * in case of mapped security
>                */
>               return 0;
> @@ -74,7 +74,7 @@ static int mp_user_setxattr(FsContext *ctx, const char *path, const char *name,
>   {
>       if (strncmp(name, "user.virtfs.", 12) == 0) {
>           /*
> -         * Don't allow fetch of user.virtfs namesapce
> +         * Don't allow fetch of user.virtfs namespace
>            * in case of mapped security
>            */
>           errno = EACCES;
> @@ -88,7 +88,7 @@ static int mp_user_removexattr(FsContext *ctx,
>   {
>       if (strncmp(name, "user.virtfs.", 12) == 0) {
>           /*
> -         * Don't allow fetch of user.virtfs namesapce
> +         * Don't allow fetch of user.virtfs namespace
>            * in case of mapped security
>            */
>           errno = EACCES;
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 0d43da19ea..5f85b16327 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -476,7 +476,7 @@ struct NvdimmFuncGetLabelDataOut {
>       /* the size of buffer filled by QEMU. */
>       uint32_t len;
>       uint32_t func_ret_status; /* return status code. */
> -    uint8_t out_buf[]; /* the data got via Get Namesapce Label function. */
> +    uint8_t out_buf[]; /* the data got via Get Namespace Label function. */
>   } QEMU_PACKED;
>   typedef struct NvdimmFuncGetLabelDataOut NvdimmFuncGetLabelDataOut;
>   QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataOut) > NVDIMM_DSM_MEMORY_SIZE);
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 1e6e0fcad9..770a38381a 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -71,7 +71,7 @@
>    *   the SUBNQN field in the controller will report the NQN of the subsystem
>    *   device. This also enables multi controller capability represented in
>    *   Identify Controller data structure in CMIC (Controller Multi-path I/O and
> - *   Namesapce Sharing Capabilities).
> + *   Namespace Sharing Capabilities).
>    *
>    * - `aerl`
>    *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number

Applied to my trivial-patches branch.

Thanks,
Laurent

